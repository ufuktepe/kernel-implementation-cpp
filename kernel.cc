#include "kernel.hh"
#include "k-apic.hh"
#include "k-vmiter.hh"
#include "obj/k-firstprocess.h"
#include "atomic.hh"

// kernel.cc
//
//    This is the kernel.


// INITIAL PHYSICAL MEMORY LAYOUT
//
//  +-------------- Base Memory --------------+
//  v                                         v
// +-----+--------------------+----------------+--------------------+---------/
// |     | Kernel      Kernel |       :    I/O | App 1        App 1 | App 2
// |     | Code + Data  Stack |  ...  : Memory | Code + Data  Stack | Code ...
// +-----+--------------------+----------------+--------------------+---------/
// 0  0x40000              0x80000 0xA0000 0x100000             0x140000
//                                             ^
//                                             | \___ PROC_SIZE ___/
//                                      PROC_START_ADDR

#define PROC_SIZE 0x40000       // initial state only

proc ptable[NPROC];             // array of process descriptors
                                // Note that `ptable[0]` is never used.
proc* current;                  // pointer to currently executing proc

#define HZ 100                  // timer interrupt frequency (interrupts/sec)
static atomic<unsigned long> ticks; // # timer interrupts so far


// Memory state - see `kernel.hh`
physpageinfo physpages[NPAGES];


[[noreturn]] void schedule();
[[noreturn]] void run(proc* p);
void exception(regstate* regs);
uintptr_t syscall(regstate* regs);
void memshow();


// kernel_start(command)
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, const char* program_name);

void kernel_start(const char* command) {
    // initialize hardware
    init_hardware();
    log_printf("Starting WeensyOS\n");

    ticks = 1;
    init_timer(HZ);

    // clear screen
    console_clear();

    // (re-)initialize kernel page table
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
        int perm = PTE_PWU;

        if (addr == 0) {
            // nullptr is inaccessible even to the kernel
            perm = 0;
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR) {
            // memory below PROC_START_ADDR, except for the single page at console is not user accessible
            perm = PTE_P | PTE_W;
        }

        // install identity mapping
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
        assert(r == 0); // mappings during kernel_start MUST NOT fail
                        // (Note that later mappings might fail!!)
    }

    // set up process descriptors
    for (pid_t i = 0; i < NPROC; i++) {
        ptable[i].pid = i;
        ptable[i].state = P_FREE;
    }
    if (!command) {
        command = WEENSYOS_FIRST_PROCESS;
    }
    if (!program_image(command).empty()) {
        process_setup(1, command);
    } else {
        process_setup(1, "allocator");
        process_setup(2, "allocator2");
        process_setup(3, "allocator3");
        process_setup(4, "allocator4");
    }

    // switch to first process using run()
    run(&ptable[1]);
}


// kalloc(sz)
//    Kernel physical memory allocator. Allocates at least `sz` contiguous bytes
//    and returns a pointer to the allocated memory, or `nullptr` on failure.
//    The returned pointer’s address is a valid physical address, but since the
//    WeensyOS kernel uses an identity mapping for virtual memory, it is also a
//    valid virtual address that the kernel can access or modify.
//
//    The allocator selects from physical pages that can be allocated for
//    process use (so not reserved pages or kernel data), and from physical
//    pages that are currently unused (`physpages[N].refcount == 0`).
//
//    On WeensyOS, `kalloc` is a page-based allocator: if `sz > PAGESIZE`
//    the allocation fails; if `sz < PAGESIZE` it allocates a whole page
//    anyway.
//
//    The handout code returns the next allocatable free page it can find.
//    It checks all pages. (You could maybe make this faster!)
//
//    The returned memory is initially filled with 0xCC, which corresponds to
//    the `int3` instruction. Executing that instruction will cause a `PANIC:
//    Unhandled exception 3!` This may help you debug.

void* kalloc(size_t sz) {
    if (sz > PAGESIZE) {
        return nullptr;
    }

    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
        if (allocatable_physical_address(pa)
            && physpages[pa / PAGESIZE].refcount == 0) {
            ++physpages[pa / PAGESIZE].refcount;
            memset((void*) pa, 0xCC, PAGESIZE);
            return (void*) pa;
        }
    }
    return nullptr;
}


// kfree(kptr)
//    Free `kptr`, which must have been previously returned by `kalloc`.
//    If `kptr == nullptr` does nothing.

void kfree(void* kptr) {
    if (!kptr) {
        return;
    }

    --physpages[(uintptr_t) kptr / PAGESIZE].refcount;
}


// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, const char* program_name) {
    init_process(&ptable[pid], 0);

    // initialize a new and empty page table
    ptable[pid].pagetable = kalloc_pagetable();

    vmiter p_it(ptable[pid].pagetable, 0);

    // copy the mappings from the kernel page table into the process page table
    for (vmiter k_it = vmiter(kernel_pagetable, 0); k_it.va() < PROC_START_ADDR; k_it += PAGESIZE) {
        int r = p_it.try_map(k_it.pa(), k_it.perm());
        assert(r == 0);
        p_it += PAGESIZE;
    }

    // obtain reference to program image
    // (The program image models the process executable.)
    program_image pgm(program_name);

    // allocate and map process memory as specified in program image
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
             a < seg.va() + seg.size();
             a += PAGESIZE) {
            // `a` is the process virtual address for the next code or data page
            // (The handout code requires that the corresponding physical
            // address is currently free.)

            // if segment is writable use writable memory, otherwise use read-only memory
            if (seg.writable()) {
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_PWU);
            } else {
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_P | PTE_U);
            }
        }
    }

    // copy instructions and data from program image into process memory
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        memset(vmiter(ptable[pid].pagetable, seg.va()).kptr(), 0, seg.size());
        memcpy(vmiter(ptable[pid].pagetable, seg.va()).kptr(), seg.data(), seg.data_size());

    }

    // mark entry point
    ptable[pid].regs.reg_rip = pgm.entry();

    // allocate and map stack segment
    // Compute process virtual address for stack page
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    // allocate memory for the stack
    vmiter(ptable[pid].pagetable, stack_addr).map(kalloc(PAGESIZE), PTE_PWU);

    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;

    // mark process as runnable
    ptable[pid].state = P_RUNNABLE;
}


// exception(regs)
//    Exception handler (for interrupts, traps, and faults).
//
//    The register values from exception time are stored in `regs`.
//    The processor responds to an exception by saving application state on
//    the kernel's stack, then jumping to kernel assembly code (in
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled when the kernel is running.

void exception(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: exception %d at rip %p\n",
                current->pid, regs->reg_intno, regs->reg_rip); */

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
        memshow();
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();


    // Actually handle the exception.
    switch (regs->reg_intno) {

    case INT_IRQ + IRQ_TIMER:
        ++ticks;
        lapicstate::get().ack();
        schedule();
        break;                  /* will not be reached */

    case INT_PF: {
        // Analyze faulting address and access type.
        uintptr_t addr = rdcr2();
        const char* operation = regs->reg_errcode & PTE_W
                ? "write" : "read";
        const char* problem = regs->reg_errcode & PTE_P
                ? "protection problem" : "missing page";

        if (!(regs->reg_errcode & PTE_U)) {
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
                       addr, operation, problem, regs->reg_rip);
        }
        error_printf(CPOS(24, 0), 0x0C00,
                     "Process %d page fault on %p (%s %s, rip=%p)!\n",
                     current->pid, addr, operation, problem, regs->reg_rip);
        current->state = P_FAULTED;
        break;
    }

    default:
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
                   regs->reg_intno, regs->reg_rip);

    }


    // Return to the current process (or run something else).
    if (current->state == P_RUNNABLE) {
        run(current);
    } else {
        schedule();
    }
}


int syscall_page_alloc(uintptr_t addr);


// sys_exit(pid)
//    Exit the given process. Marks the process as free and frees all of its memory. This includes the process’s code,
//    data, heap, and stack pages, as well as the pages used for its page directory and page table pages.

void sys_exit(pid_t pid) {
    // iterate over each page in the process's page table
    for (vmiter it = vmiter(ptable[pid].pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
        // free the page if it is a non-console and user-accessible page
        if (it.va() == CONSOLE_ADDR || !it.user()) {
            continue;
        }
        kfree(it.kptr());
    }

    // free the physical memory used to represent the page table of the process
    for (ptiter it(ptable[pid].pagetable); !it.done(); it.next()) {
        kfree(it.kptr());
    }

    // mark process as free
    ptable[pid].state = P_FREE;

    // free the top level (L4) page table page
    kfree(ptable[pid].pagetable);
}


// syscall_fork()
//    Start a new (child) process as a copy of the calling (parent) process. The child and parent processes run in
//    separate memory spaces. At the time of fork() both memory spaces have the same content. On success, the PID of
//    the child process is returned in the parent, and 0 is returned in the child. On failure, -1 is returned in the
//    parent, no child process is created.

pid_t syscall_fork() {
    // pid for the child process
    pid_t c_pid = 0;

    // look for a free process slot for the child
    for (pid_t i = 1; i < NPROC; ++i) {
        if (ptable[i].state == P_FREE) {
            c_pid = i;
            break;
        }
    }

    // fail if there is no free process slot
    if (!c_pid) {
        return -1;
    }

    // allocate a new and empty page table
    ptable[c_pid].pagetable = kalloc_pagetable();

    // fail if allocation is unsuccessful
    if (ptable[c_pid].pagetable == nullptr) {
        return -1;
    }

    // create iterators for the parent and child processes
    vmiter p_it(ptable[current->pid].pagetable, 0);
    vmiter c_it(ptable[c_pid].pagetable, 0);

    // iterate over every virtual address
    while (p_it.va() < MEMSIZE_VIRTUAL) {
        if (p_it.va() < PROC_START_ADDR) {
            // the parent and child page tables should have identical mappings below PROC_START_ADDR
            int r = c_it.try_map(p_it.pa(), p_it.perm());
            if (r < 0) {
                sys_exit(c_pid);
                return -1;
            }
        } else if (p_it.writable() && p_it.user()) {
            // allocate a new physical page for the writable and user-accessible page
            void* new_addr = kalloc(PAGESIZE);
            if (new_addr == nullptr) {
                sys_exit(c_pid);
                return -1;
            }
            int r = c_it.try_map(new_addr, p_it.perm());
            if (r < 0) {
                sys_exit(c_pid);
                kfree(new_addr);
                return -1;
            }
            // copy the data from the parent’s page into the child's page
            memcpy(new_addr, p_it.kptr(), PAGESIZE);
        } else if (!p_it.writable() && p_it.user()) {
            // share read-only pages between processes
            int r = c_it.try_map(p_it.pa(), p_it.perm());
            if (r < 0) {
                sys_exit(c_pid);
                return -1;
            }
            // increment refcount since the existing physical address will also be used by the child process
            ++physpages[p_it.pa() / PAGESIZE].refcount;
        }

        p_it += PAGESIZE;
        c_it += PAGESIZE;
    }

    // initialize the child process's registers as a copy of the parent process's registers, except for reg_rax
    ptable[c_pid].regs = current->regs;
    ptable[c_pid].regs.reg_rax = 0;

    ptable[c_pid].state = P_RUNNABLE;

    return c_pid;
}

// syscall(regs)
//    Handle a system call initiated by a `syscall` instruction.
//    The process’s register values at system call time are accessible in
//    `regs`.
//
//    If this function returns with value `V`, then the user process will
//    resume with `V` stored in `%rax` (so the system call effectively
//    returns `V`). Alternately, the kernel can exit this function by
//    calling `schedule()`, perhaps after storing the eventual system call
//    return value in `current->regs.reg_rax`.
//
//    It is only valid to return from this function if
//    `current->state == P_RUNNABLE`.
//
//    Note that hardware interrupts are disabled when the kernel is running.

uintptr_t syscall(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: syscall %d at rip %p\n",
                  current->pid, regs->reg_rax, regs->reg_rip); */

    // Show the current cursor location and memory state.
    console_show_cursor(cursorpos);
    memshow();

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();

    // Actually handle the exception.
    switch (regs->reg_rax) {

    case SYSCALL_PANIC:
        user_panic(current);
        break; // will not be reached

    case SYSCALL_GETPID:
        return current->pid;

    case SYSCALL_YIELD:
        current->regs.reg_rax = 0;
        schedule();             // does not return

    case SYSCALL_PAGE_ALLOC:
        return syscall_page_alloc(current->regs.reg_rdi);

    case SYSCALL_FORK:
        return syscall_fork();

    case SYSCALL_EXIT:
        sys_exit(current->pid);
        schedule();

    default:
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
                   regs->reg_rax, current->pid, regs->reg_rip);

    }

    panic("Should not get here!\n");
}


// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    implements the specification for `sys_page_alloc` in `u-lib.hh`.

int syscall_page_alloc(uintptr_t addr) {
    void* new_addr = kalloc(PAGESIZE);

    if (addr % PAGESIZE != 0 || addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL || new_addr == nullptr) {
        return -1;
    }

    pid_t pid = current->pid;
    int r = vmiter(ptable[pid].pagetable, addr).try_map(new_addr, PTE_PWU);

    // if mapping was unsuccessful, free the allocated memory and return -1
    if (r < 0) {
        kfree(new_addr);
        return -1;
    }

    memset(new_addr, 0, PAGESIZE);
    return 0;
}


// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule() {
    pid_t pid = current->pid;
    for (unsigned spins = 1; true; ++spins) {
        pid = (pid + 1) % NPROC;
        if (ptable[pid].state == P_RUNNABLE) {
            run(&ptable[pid]);
        }

        // If Control-C was typed, exit the virtual machine.
        check_keyboard();

        // If spinning forever, show the memviewer.
        if (spins % (1 << 12) == 0) {
            memshow();
            log_printf("%u\n", spins);
        }
    }
}


// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
    assert(p->state == P_RUNNABLE);
    current = p;
    // Check the process's current pagetable.
    check_pagetable(p->pagetable);

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);

    // should never get here
    while (true) {
    }
}


// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
        last_ticks = ticks;
        showing = (showing + 1) % NPROC;
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < NPROC; ++search) {
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % NPROC;
        }
    }

    console_memviewer(p);
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}
