
obj/p-exit.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <sys_exit()>:
    return make_syscall(SYSCALL_FORK);
}

// sys_exit()
//    Exit this process. Does not return.
[[noreturn]] inline void sys_exit() {
  100000:	f3 0f 1e fa          	endbr64 
    register uintptr_t rax asm("rax") = syscallno;
  100004:	b8 06 00 00 00       	mov    $0x6,%eax
    asm volatile ("syscall"
  100009:	0f 05                	syscall 
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100010:	bf 60 10 10 00       	mov    $0x101060,%edi
  100015:	0f 05                	syscall 
    make_syscall(SYSCALL_EXIT);
    make_syscall(SYSCALL_PANIC, (uintptr_t) "sys_exit should not return!");

    // should never get here
    while (true) {
  100017:	eb fe                	jmp    100017 <sys_exit()+0x17>

0000000000100019 <process_main()>:
uint8_t* stack_bottom;

// Remember which pages we wrote data into
unsigned char pagemark[4096] = {0};

void process_main() {
  100019:	f3 0f 1e fa          	endbr64 
  10001d:	55                   	push   %rbp
  10001e:	48 89 e5             	mov    %rsp,%rbp
  100021:	41 57                	push   %r15
  100023:	41 56                	push   %r14
  100025:	41 55                	push   %r13
  100027:	41 54                	push   %r12
  100029:	53                   	push   %rbx
  10002a:	48 83 ec 08          	sub    $0x8,%rsp
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10002e:	b8 00 00 00 00       	mov    $0x0,%eax
        assert(pagemark[i] == 0);
  100033:	80 b8 00 20 10 00 00 	cmpb   $0x0,0x102000(%rax)
  10003a:	75 0e                	jne    10004a <process_main()+0x31>
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10003c:	48 83 c0 01          	add    $0x1,%rax
  100040:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
  100046:	75 eb                	jne    100033 <process_main()+0x1a>
  100048:	eb 2b                	jmp    100075 <process_main()+0x5c>
        assert(pagemark[i] == 0);
  10004a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10004f:	ba 7c 10 10 00       	mov    $0x10107c,%edx
  100054:	be 10 00 00 00       	mov    $0x10,%esi
  100059:	bf 8d 10 10 00       	mov    $0x10108d,%edi
  10005e:	e8 7e 0f 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
        if (x == 0) {
            // fork, then either exit or start allocating
            pid_t p = sys_fork();
            int choice = rand(0, 2);
            if (choice == 0 && p > 0) {
                sys_exit();
  100063:	e8 98 ff ff ff       	call   100000 <sys_exit()>
            } else if (choice != 2 ? p > 0 : p == 0) {
  100068:	85 db                	test   %ebx,%ebx
  10006a:	75 09                	jne    100075 <process_main()+0x5c>
  10006c:	eb 44                	jmp    1000b2 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  10006e:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100073:	0f 05                	syscall 
        int x = rand(0, ALLOC_SLOWDOWN);
  100075:	be 12 00 00 00       	mov    $0x12,%esi
  10007a:	bf 00 00 00 00       	mov    $0x0,%edi
  10007f:	e8 ae 03 00 00       	call   100432 <rand(int, int)>
        if (x == 0) {
  100084:	85 c0                	test   %eax,%eax
  100086:	75 e6                	jne    10006e <process_main()+0x55>
    register uintptr_t rax asm("rax") = syscallno;
  100088:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10008d:	0f 05                	syscall 
    return rax;
  10008f:	48 89 c3             	mov    %rax,%rbx
            int choice = rand(0, 2);
  100092:	be 02 00 00 00       	mov    $0x2,%esi
  100097:	bf 00 00 00 00       	mov    $0x0,%edi
  10009c:	e8 91 03 00 00       	call   100432 <rand(int, int)>
            if (choice == 0 && p > 0) {
  1000a1:	85 c0                	test   %eax,%eax
  1000a3:	75 04                	jne    1000a9 <process_main()+0x90>
  1000a5:	85 db                	test   %ebx,%ebx
  1000a7:	7f ba                	jg     100063 <process_main()+0x4a>
            } else if (choice != 2 ? p > 0 : p == 0) {
  1000a9:	83 f8 02             	cmp    $0x2,%eax
  1000ac:	74 ba                	je     100068 <process_main()+0x4f>
  1000ae:	85 db                	test   %ebx,%ebx
  1000b0:	7e c3                	jle    100075 <process_main()+0x5c>
        } else {
            sys_yield();
        }
    }

    int speed = rand(1, 16);
  1000b2:	be 10 00 00 00       	mov    $0x10,%esi
  1000b7:	bf 01 00 00 00       	mov    $0x1,%edi
  1000bc:	e8 71 03 00 00       	call   100432 <rand(int, int)>
  1000c1:	89 c3                	mov    %eax,%ebx
    register uintptr_t rax asm("rax") = syscallno;
  1000c3:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000c8:	0f 05                	syscall 
    return make_syscall(SYSCALL_GETPID);
  1000ca:	41 89 c5             	mov    %eax,%r13d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000cd:	41 bc 1b 40 10 00    	mov    $0x10401b,%r12d
    pid_t self = sys_getpid();

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1000d3:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
    heap_top = heap_bottom;
  1000da:	4c 89 25 27 2f 00 00 	mov    %r12,0x2f27(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000e1:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000e4:	48 83 e8 01          	sub    $0x1,%rax
  1000e8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000ee:	48 89 05 0b 2f 00 00 	mov    %rax,0x2f0b(%rip)        # 103000 <stack_bottom>
    unsigned nalloc = 0;

    // Allocate heap pages until out of address space,
    // forking along the way.
    while (heap_top != stack_bottom) {
  1000f5:	4c 39 e0             	cmp    %r12,%rax
  1000f8:	0f 84 30 02 00 00    	je     10032e <process_main()+0x315>
    unsigned nalloc = 0;
  1000fe:	41 be 00 00 00 00    	mov    $0x0,%r14d
  100104:	eb 34                	jmp    10013a <process_main()+0x121>
        if (x >= 8 * speed) {
            if (x % 4 < 2 && heap_top != heap_bottom) {
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
                if (pn < sizeof(pagemark)) {
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
                    assert(*addr == pagemark[pn]);
  100106:	b9 00 00 00 00       	mov    $0x0,%ecx
  10010b:	ba 97 10 10 00       	mov    $0x101097,%edx
  100110:	be 34 00 00 00       	mov    $0x34,%esi
  100115:	bf 8d 10 10 00       	mov    $0x10108d,%edi
  10011a:	e8 c2 0e 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  10011f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100124:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  100126:	48 8b 05 d3 2e 00 00 	mov    0x2ed3(%rip),%rax        # 103000 <stack_bottom>
  10012d:	48 39 05 d4 2e 00 00 	cmp    %rax,0x2ed4(%rip)        # 103008 <heap_top>
  100134:	0f 84 f4 01 00 00    	je     10032e <process_main()+0x315>
        int x = rand(0, 6 * ALLOC_SLOWDOWN);
  10013a:	be 6c 00 00 00       	mov    $0x6c,%esi
  10013f:	bf 00 00 00 00       	mov    $0x0,%edi
  100144:	e8 e9 02 00 00       	call   100432 <rand(int, int)>
        if (x >= 8 * speed) {
  100149:	8d 14 dd 00 00 00 00 	lea    0x0(,%rbx,8),%edx
  100150:	39 c2                	cmp    %eax,%edx
  100152:	0f 8f 88 00 00 00    	jg     1001e0 <process_main()+0x1c7>
            if (x % 4 < 2 && heap_top != heap_bottom) {
  100158:	99                   	cltd   
  100159:	c1 ea 1e             	shr    $0x1e,%edx
  10015c:	01 d0                	add    %edx,%eax
  10015e:	83 e0 03             	and    $0x3,%eax
  100161:	29 d0                	sub    %edx,%eax
  100163:	83 f8 01             	cmp    $0x1,%eax
  100166:	7f b7                	jg     10011f <process_main()+0x106>
  100168:	48 8b 05 99 2e 00 00 	mov    0x2e99(%rip),%rax        # 103008 <heap_top>
  10016f:	4c 39 e0             	cmp    %r12,%rax
  100172:	74 ab                	je     10011f <process_main()+0x106>
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
  100174:	4c 29 e0             	sub    %r12,%rax
  100177:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  10017b:	48 c1 ee 0c          	shr    $0xc,%rsi
  10017f:	bf 00 00 00 00       	mov    $0x0,%edi
  100184:	e8 a9 02 00 00       	call   100432 <rand(int, int)>
                if (pn < sizeof(pagemark)) {
  100189:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  10018e:	77 8f                	ja     10011f <process_main()+0x106>
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
  100190:	89 c1                	mov    %eax,%ecx
  100192:	48 89 ca             	mov    %rcx,%rdx
  100195:	48 c1 e2 0c          	shl    $0xc,%rdx
  100199:	4c 01 e2             	add    %r12,%rdx
                    assert(*addr == pagemark[pn]);
  10019c:	0f b6 32             	movzbl (%rdx),%esi
  10019f:	40 3a b1 00 20 10 00 	cmp    0x102000(%rcx),%sil
  1001a6:	0f 85 5a ff ff ff    	jne    100106 <process_main()+0xed>
                    *addr = pagemark[pn] = self;
  1001ac:	89 c0                	mov    %eax,%eax
  1001ae:	44 88 a8 00 20 10 00 	mov    %r13b,0x102000(%rax)
  1001b5:	44 88 2a             	mov    %r13b,(%rdx)
                    assert(*addr == self);
  1001b8:	0f b6 02             	movzbl (%rdx),%eax
  1001bb:	0f b6 c0             	movzbl %al,%eax
  1001be:	44 39 e8             	cmp    %r13d,%eax
  1001c1:	0f 84 58 ff ff ff    	je     10011f <process_main()+0x106>
  1001c7:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001cc:	ba ad 10 10 00       	mov    $0x1010ad,%edx
  1001d1:	be 36 00 00 00       	mov    $0x36,%esi
  1001d6:	bf 8d 10 10 00       	mov    $0x10108d,%edi
  1001db:	e8 01 0e 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
            }
            sys_yield();
            continue;
        }

        x = rand(0, 7 + min(nalloc / 4, 10U));
  1001e0:	44 89 f6             	mov    %r14d,%esi
  1001e3:	c1 ee 02             	shr    $0x2,%esi
  1001e6:	b8 0a 00 00 00       	mov    $0xa,%eax
  1001eb:	39 c6                	cmp    %eax,%esi
  1001ed:	0f 47 f0             	cmova  %eax,%esi
  1001f0:	83 c6 07             	add    $0x7,%esi
  1001f3:	bf 00 00 00 00       	mov    $0x0,%edi
  1001f8:	e8 35 02 00 00       	call   100432 <rand(int, int)>
        if (x < 2) {
  1001fd:	83 f8 01             	cmp    $0x1,%eax
  100200:	7e 2a                	jle    10022c <process_main()+0x213>
                pid_t new_self = sys_getpid();
                assert(new_self != self);
                self = new_self;
                speed = rand(1, 16);
            }
        } else if (x < 3) {
  100202:	83 f8 02             	cmp    $0x2,%eax
  100205:	7e 75                	jle    10027c <process_main()+0x263>
    register uintptr_t rax asm("rax") = syscallno;
  100207:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  10020c:	48 8b 3d f5 2d 00 00 	mov    0x2df5(%rip),%rdi        # 103008 <heap_top>
  100213:	0f 05                	syscall 
            sys_exit();
        } else if (sys_page_alloc(heap_top) >= 0) {
  100215:	85 c0                	test   %eax,%eax
  100217:	79 68                	jns    100281 <process_main()+0x268>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
            // clear "Out of physical memory" msg
            if (console[CPOS(24, 0)]) {
                console_printf(CPOS(24, 0), 0, "\n");
            }
        } else if (nalloc < 4) {
  100219:	41 83 fe 03          	cmp    $0x3,%r14d
  10021d:	0f 86 06 01 00 00    	jbe    100329 <process_main()+0x310>
            sys_exit();
        } else {
            nalloc -= 4;
  100223:	41 83 ee 04          	sub    $0x4,%r14d
  100227:	e9 fa fe ff ff       	jmp    100126 <process_main()+0x10d>
    register uintptr_t rax asm("rax") = syscallno;
  10022c:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100231:	0f 05                	syscall 
            if (sys_fork() == 0) {
  100233:	85 c0                	test   %eax,%eax
  100235:	0f 85 eb fe ff ff    	jne    100126 <process_main()+0x10d>
    register uintptr_t rax asm("rax") = syscallno;
  10023b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100240:	0f 05                	syscall 
    return rax;
  100242:	49 89 c7             	mov    %rax,%r15
                assert(new_self != self);
  100245:	44 39 e8             	cmp    %r13d,%eax
  100248:	74 19                	je     100263 <process_main()+0x24a>
                speed = rand(1, 16);
  10024a:	be 10 00 00 00       	mov    $0x10,%esi
  10024f:	bf 01 00 00 00       	mov    $0x1,%edi
  100254:	e8 d9 01 00 00       	call   100432 <rand(int, int)>
  100259:	89 c3                	mov    %eax,%ebx
                self = new_self;
  10025b:	45 89 fd             	mov    %r15d,%r13d
  10025e:	e9 c3 fe ff ff       	jmp    100126 <process_main()+0x10d>
                assert(new_self != self);
  100263:	b9 00 00 00 00       	mov    $0x0,%ecx
  100268:	ba bb 10 10 00       	mov    $0x1010bb,%edx
  10026d:	be 41 00 00 00       	mov    $0x41,%esi
  100272:	bf 8d 10 10 00       	mov    $0x10108d,%edi
  100277:	e8 65 0d 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  10027c:	e8 7f fd ff ff       	call   100000 <sys_exit()>
            for (unsigned long* l = (unsigned long*) heap_top;
  100281:	48 8b 0d 80 2d 00 00 	mov    0x2d80(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100288:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  10028f:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  100292:	48 83 38 00          	cmpq   $0x0,(%rax)
  100296:	75 78                	jne    100310 <process_main()+0x2f7>
            for (unsigned long* l = (unsigned long*) heap_top;
  100298:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  10029c:	48 39 d0             	cmp    %rdx,%rax
  10029f:	75 f1                	jne    100292 <process_main()+0x279>
            *heap_top = speed;
  1002a1:	88 19                	mov    %bl,(%rcx)
            console[CPOS(24, 79)] = speed;
  1002a3:	66 89 1d f4 8c fb ff 	mov    %bx,-0x4730c(%rip)        # b8f9e <console+0xf9e>
            unsigned pn = (heap_top - heap_bottom) / PAGESIZE;
  1002aa:	48 8b 05 57 2d 00 00 	mov    0x2d57(%rip),%rax        # 103008 <heap_top>
  1002b1:	48 89 c2             	mov    %rax,%rdx
  1002b4:	4c 29 e2             	sub    %r12,%rdx
  1002b7:	48 c1 ea 0c          	shr    $0xc,%rdx
            if (pn < sizeof(pagemark)) {
  1002bb:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  1002c1:	77 08                	ja     1002cb <process_main()+0x2b2>
                pagemark[pn] = speed;
  1002c3:	89 d2                	mov    %edx,%edx
  1002c5:	88 9a 00 20 10 00    	mov    %bl,0x102000(%rdx)
            heap_top += PAGESIZE;
  1002cb:	48 05 00 10 00 00    	add    $0x1000,%rax
  1002d1:	48 89 05 30 2d 00 00 	mov    %rax,0x2d30(%rip)        # 103008 <heap_top>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
  1002d8:	4c 29 e0             	sub    %r12,%rax
  1002db:	49 89 c6             	mov    %rax,%r14
  1002de:	49 c1 ee 0c          	shr    $0xc,%r14
            if (console[CPOS(24, 0)]) {
  1002e2:	0f b7 05 17 8c fb ff 	movzwl -0x473e9(%rip),%eax        # b8f00 <console+0xf00>
  1002e9:	66 85 c0             	test   %ax,%ax
  1002ec:	0f 84 34 fe ff ff    	je     100126 <process_main()+0x10d>
                console_printf(CPOS(24, 0), 0, "\n");
  1002f2:	ba d4 10 10 00       	mov    $0x1010d4,%edx
  1002f7:	be 00 00 00 00       	mov    $0x0,%esi
  1002fc:	bf 80 07 00 00       	mov    $0x780,%edi
  100301:	b8 00 00 00 00       	mov    $0x0,%eax
  100306:	e8 9c 0c 00 00       	call   100fa7 <console_printf(int, int, char const*, ...)>
  10030b:	e9 16 fe ff ff       	jmp    100126 <process_main()+0x10d>
                assert(*l == 0);
  100310:	b9 00 00 00 00       	mov    $0x0,%ecx
  100315:	ba cc 10 10 00       	mov    $0x1010cc,%edx
  10031a:	be 4c 00 00 00       	mov    $0x4c,%esi
  10031f:	bf 8d 10 10 00       	mov    $0x10108d,%edi
  100324:	e8 b8 0c 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  100329:	e8 d2 fc ff ff       	call   100000 <sys_exit()>
        }
    }

    // After running out of memory
    while (true) {
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  10032e:	be 23 00 00 00       	mov    $0x23,%esi
  100333:	bf 00 00 00 00       	mov    $0x0,%edi
  100338:	e8 f5 00 00 00       	call   100432 <rand(int, int)>
  10033d:	85 c0                	test   %eax,%eax
  10033f:	74 09                	je     10034a <process_main()+0x331>
    register uintptr_t rax asm("rax") = syscallno;
  100341:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100346:	0f 05                	syscall 
}
  100348:	eb e4                	jmp    10032e <process_main()+0x315>
            sys_exit();
  10034a:	e8 b1 fc ff ff       	call   100000 <sys_exit()>
  10034f:	90                   	nop

0000000000100350 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  100350:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  100354:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100358:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  10035c:	73 0b                	jae    100369 <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  10035e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100362:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100366:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100369:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  10036e:	c3                   	ret    

000000000010036f <strlen>:
size_t strlen(const char* s) {
  10036f:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  100373:	80 3f 00             	cmpb   $0x0,(%rdi)
  100376:	74 10                	je     100388 <strlen+0x19>
  100378:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  10037d:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100381:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100385:	75 f6                	jne    10037d <strlen+0xe>
  100387:	c3                   	ret    
  100388:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10038d:	c3                   	ret    

000000000010038e <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  10038e:	f3 0f 1e fa          	endbr64 
  100392:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100395:	ba 00 00 00 00       	mov    $0x0,%edx
  10039a:	48 85 f6             	test   %rsi,%rsi
  10039d:	74 11                	je     1003b0 <strnlen+0x22>
  10039f:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1003a3:	74 0c                	je     1003b1 <strnlen+0x23>
        ++n;
  1003a5:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003a9:	48 39 d0             	cmp    %rdx,%rax
  1003ac:	75 f1                	jne    10039f <strnlen+0x11>
  1003ae:	eb 04                	jmp    1003b4 <strnlen+0x26>
  1003b0:	c3                   	ret    
  1003b1:	48 89 d0             	mov    %rdx,%rax
}
  1003b4:	c3                   	ret    

00000000001003b5 <strchr>:
char* strchr(const char* s, int c) {
  1003b5:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  1003b9:	0f b6 07             	movzbl (%rdi),%eax
  1003bc:	84 c0                	test   %al,%al
  1003be:	74 10                	je     1003d0 <strchr+0x1b>
  1003c0:	40 38 f0             	cmp    %sil,%al
  1003c3:	74 18                	je     1003dd <strchr+0x28>
        ++s;
  1003c5:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1003c9:	0f b6 07             	movzbl (%rdi),%eax
  1003cc:	84 c0                	test   %al,%al
  1003ce:	75 f0                	jne    1003c0 <strchr+0xb>
        return nullptr;
  1003d0:	40 84 f6             	test   %sil,%sil
  1003d3:	b8 00 00 00 00       	mov    $0x0,%eax
  1003d8:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1003dc:	c3                   	ret    
  1003dd:	48 89 f8             	mov    %rdi,%rax
  1003e0:	c3                   	ret    

00000000001003e1 <rand()>:
int rand() {
  1003e1:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  1003e5:	83 3d 2c 2c 00 00 00 	cmpl   $0x0,0x2c2c(%rip)        # 103018 <rand_seed_set>
  1003ec:	74 27                	je     100415 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1003ee:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1003f5:	f4 51 58 
  1003f8:	48 0f af 05 10 2c 00 	imul   0x2c10(%rip),%rax        # 103010 <rand_seed>
  1003ff:	00 
  100400:	48 83 c0 01          	add    $0x1,%rax
  100404:	48 89 05 05 2c 00 00 	mov    %rax,0x2c05(%rip)        # 103010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  10040b:	48 c1 e8 20          	shr    $0x20,%rax
  10040f:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100414:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  100415:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  10041c:	87 d4 30 
  10041f:	48 89 05 ea 2b 00 00 	mov    %rax,0x2bea(%rip)        # 103010 <rand_seed>
    rand_seed_set = 1;
  100426:	c7 05 e8 2b 00 00 01 	movl   $0x1,0x2be8(%rip)        # 103018 <rand_seed_set>
  10042d:	00 00 00 
}
  100430:	eb bc                	jmp    1003ee <rand()+0xd>

0000000000100432 <rand(int, int)>:
int rand(int min, int max) {
  100432:	f3 0f 1e fa          	endbr64 
  100436:	55                   	push   %rbp
  100437:	48 89 e5             	mov    %rsp,%rbp
  10043a:	41 54                	push   %r12
  10043c:	53                   	push   %rbx
    assert(min <= max);
  10043d:	39 f7                	cmp    %esi,%edi
  10043f:	7f 26                	jg     100467 <rand(int, int)+0x35>
  100441:	41 89 fc             	mov    %edi,%r12d
  100444:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  100446:	e8 96 ff ff ff       	call   1003e1 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  10044b:	44 29 e3             	sub    %r12d,%ebx
  10044e:	83 c3 01             	add    $0x1,%ebx
  100451:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  100454:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100456:	48 0f af d8          	imul   %rax,%rbx
  10045a:	48 c1 eb 1f          	shr    $0x1f,%rbx
  10045e:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  100462:	5b                   	pop    %rbx
  100463:	41 5c                	pop    %r12
  100465:	5d                   	pop    %rbp
  100466:	c3                   	ret    
    assert(min <= max);
  100467:	b9 00 00 00 00       	mov    $0x0,%ecx
  10046c:	ba d6 10 10 00       	mov    $0x1010d6,%edx
  100471:	be 45 01 00 00       	mov    $0x145,%esi
  100476:	bf e1 10 10 00       	mov    $0x1010e1,%edi
  10047b:	e8 61 0b 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>

0000000000100480 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  100480:	f3 0f 1e fa          	endbr64 
  100484:	55                   	push   %rbp
  100485:	48 89 e5             	mov    %rsp,%rbp
  100488:	41 57                	push   %r15
  10048a:	41 56                	push   %r14
  10048c:	41 55                	push   %r13
  10048e:	41 54                	push   %r12
  100490:	53                   	push   %rbx
  100491:	48 83 ec 58          	sub    $0x58,%rsp
  100495:	49 89 fe             	mov    %rdi,%r14
  100498:	89 75 ac             	mov    %esi,-0x54(%rbp)
  10049b:	49 89 d4             	mov    %rdx,%r12
  10049e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1004a2:	0f b6 02             	movzbl (%rdx),%eax
  1004a5:	84 c0                	test   %al,%al
  1004a7:	0f 85 cc 05 00 00    	jne    100a79 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  1004ad:	48 83 c4 58          	add    $0x58,%rsp
  1004b1:	5b                   	pop    %rbx
  1004b2:	41 5c                	pop    %r12
  1004b4:	41 5d                	pop    %r13
  1004b6:	41 5e                	pop    %r14
  1004b8:	41 5f                	pop    %r15
  1004ba:	5d                   	pop    %rbp
  1004bb:	c3                   	ret    
        for (++format; *format; ++format) {
  1004bc:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  1004c1:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  1004c7:	84 db                	test   %bl,%bl
  1004c9:	0f 84 f4 07 00 00    	je     100cc3 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  1004cf:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  1004d5:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  1004db:	0f be f3             	movsbl %bl,%esi
  1004de:	bf f1 17 10 00       	mov    $0x1017f1,%edi
  1004e3:	e8 cd fe ff ff       	call   1003b5 <strchr>
  1004e8:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1004eb:	48 85 c0             	test   %rax,%rax
  1004ee:	74 70                	je     100560 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1004f0:	48 81 e9 f1 17 10 00 	sub    $0x1017f1,%rcx
  1004f7:	44 89 e0             	mov    %r12d,%eax
  1004fa:	d3 e0                	shl    %cl,%eax
  1004fc:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1004ff:	49 83 c7 01          	add    $0x1,%r15
  100503:	41 0f b6 1f          	movzbl (%r15),%ebx
  100507:	84 db                	test   %bl,%bl
  100509:	75 d0                	jne    1004db <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  10050b:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  10050f:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100515:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  10051c:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  100520:	0f 84 c8 00 00 00    	je     1005ee <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  100526:	41 0f b6 07          	movzbl (%r15),%eax
  10052a:	3c 6c                	cmp    $0x6c,%al
  10052c:	0f 84 50 01 00 00    	je     100682 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  100532:	0f 8f 3e 01 00 00    	jg     100676 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  100538:	3c 68                	cmp    $0x68,%al
  10053a:	0f 85 62 01 00 00    	jne    1006a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  100540:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  100544:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  100549:	8d 50 bd             	lea    -0x43(%rax),%edx
  10054c:	80 fa 35             	cmp    $0x35,%dl
  10054f:	0f 87 de 05 00 00    	ja     100b33 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  100555:	0f b6 d2             	movzbl %dl,%edx
  100558:	3e ff 24 d5 00 11 10 	notrack jmp *0x101100(,%rdx,8)
  10055f:	00 
        if (*format >= '1' && *format <= '9') {
  100560:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  100564:	8d 43 cf             	lea    -0x31(%rbx),%eax
  100567:	3c 08                	cmp    $0x8,%al
  100569:	77 34                	ja     10059f <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10056b:	41 0f b6 07          	movzbl (%r15),%eax
  10056f:	8d 50 d0             	lea    -0x30(%rax),%edx
  100572:	80 fa 09             	cmp    $0x9,%dl
  100575:	77 61                	ja     1005d8 <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  100577:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  10057d:	49 83 c7 01          	add    $0x1,%r15
  100581:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  100586:	0f be c0             	movsbl %al,%eax
  100589:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10058e:	41 0f b6 07          	movzbl (%r15),%eax
  100592:	8d 50 d0             	lea    -0x30(%rax),%edx
  100595:	80 fa 09             	cmp    $0x9,%dl
  100598:	76 e3                	jbe    10057d <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  10059a:	e9 76 ff ff ff       	jmp    100515 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  10059f:	80 fb 2a             	cmp    $0x2a,%bl
  1005a2:	75 3f                	jne    1005e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  1005a4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005a8:	8b 07                	mov    (%rdi),%eax
  1005aa:	83 f8 2f             	cmp    $0x2f,%eax
  1005ad:	77 17                	ja     1005c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1005af:	89 c2                	mov    %eax,%edx
  1005b1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1005b5:	83 c0 08             	add    $0x8,%eax
  1005b8:	89 07                	mov    %eax,(%rdi)
  1005ba:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1005bd:	49 83 c7 01          	add    $0x1,%r15
  1005c1:	e9 4f ff ff ff       	jmp    100515 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  1005c6:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005ca:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005ce:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005d2:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005d6:	eb e2                	jmp    1005ba <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1005d8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1005de:	e9 32 ff ff ff       	jmp    100515 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  1005e3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1005e9:	e9 27 ff ff ff       	jmp    100515 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  1005ee:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  1005f2:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1005f7:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1005fa:	80 f9 09             	cmp    $0x9,%cl
  1005fd:	76 13                	jbe    100612 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  1005ff:	3c 2a                	cmp    $0x2a,%al
  100601:	74 33                	je     100636 <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  100603:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  100606:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  10060d:	e9 14 ff ff ff       	jmp    100526 <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100612:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100617:	48 83 c2 01          	add    $0x1,%rdx
  10061b:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  10061e:	0f be c0             	movsbl %al,%eax
  100621:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100625:	0f b6 02             	movzbl (%rdx),%eax
  100628:	8d 70 d0             	lea    -0x30(%rax),%esi
  10062b:	40 80 fe 09          	cmp    $0x9,%sil
  10062f:	76 e6                	jbe    100617 <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  100631:	49 89 d7             	mov    %rdx,%r15
  100634:	eb 1c                	jmp    100652 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  100636:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10063a:	8b 01                	mov    (%rcx),%eax
  10063c:	83 f8 2f             	cmp    $0x2f,%eax
  10063f:	77 23                	ja     100664 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  100641:	89 c2                	mov    %eax,%edx
  100643:	48 03 51 10          	add    0x10(%rcx),%rdx
  100647:	83 c0 08             	add    $0x8,%eax
  10064a:	89 01                	mov    %eax,(%rcx)
  10064c:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  10064e:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  100652:	85 c9                	test   %ecx,%ecx
  100654:	b8 00 00 00 00       	mov    $0x0,%eax
  100659:	0f 49 c1             	cmovns %ecx,%eax
  10065c:	89 45 a8             	mov    %eax,-0x58(%rbp)
  10065f:	e9 c2 fe ff ff       	jmp    100526 <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  100664:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100668:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10066c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100670:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100674:	eb d6                	jmp    10064c <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  100676:	3c 74                	cmp    $0x74,%al
  100678:	74 08                	je     100682 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  10067a:	3c 7a                	cmp    $0x7a,%al
  10067c:	0f 85 77 06 00 00    	jne    100cf9 <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  100682:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  100686:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  10068b:	8d 50 bd             	lea    -0x43(%rax),%edx
  10068e:	80 fa 35             	cmp    $0x35,%dl
  100691:	0f 87 9c 04 00 00    	ja     100b33 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  100697:	0f b6 d2             	movzbl %dl,%edx
  10069a:	3e ff 24 d5 b0 12 10 	notrack jmp *0x1012b0(,%rdx,8)
  1006a1:	00 
  1006a2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1006a5:	80 fa 35             	cmp    $0x35,%dl
  1006a8:	0f 87 82 04 00 00    	ja     100b30 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  1006ae:	0f b6 d2             	movzbl %dl,%edx
  1006b1:	3e ff 24 d5 60 14 10 	notrack jmp *0x101460(,%rdx,8)
  1006b8:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1006b9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006bd:	8b 07                	mov    (%rdi),%eax
  1006bf:	83 f8 2f             	cmp    $0x2f,%eax
  1006c2:	77 3a                	ja     1006fe <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  1006c4:	89 c2                	mov    %eax,%edx
  1006c6:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006ca:	83 c0 08             	add    $0x8,%eax
  1006cd:	89 07                	mov    %eax,(%rdi)
  1006cf:	48 8b 12             	mov    (%rdx),%rdx
  1006d2:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1006d5:	48 89 d0             	mov    %rdx,%rax
  1006d8:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1006dc:	49 89 d2             	mov    %rdx,%r10
  1006df:	49 f7 da             	neg    %r10
  1006e2:	25 00 01 00 00       	and    $0x100,%eax
  1006e7:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1006eb:	0b 45 a0             	or     -0x60(%rbp),%eax
  1006ee:	0c c0                	or     $0xc0,%al
  1006f0:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  1006f3:	41 bc d5 10 10 00    	mov    $0x1010d5,%r12d
            break;
  1006f9:	e9 ec 01 00 00       	jmp    1008ea <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1006fe:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100702:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100706:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10070a:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10070e:	eb bf                	jmp    1006cf <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  100710:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100713:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100717:	8b 01                	mov    (%rcx),%eax
  100719:	83 f8 2f             	cmp    $0x2f,%eax
  10071c:	77 10                	ja     10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  10071e:	89 c2                	mov    %eax,%edx
  100720:	48 03 51 10          	add    0x10(%rcx),%rdx
  100724:	83 c0 08             	add    $0x8,%eax
  100727:	89 01                	mov    %eax,(%rcx)
  100729:	48 63 12             	movslq (%rdx),%rdx
  10072c:	eb a7                	jmp    1006d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  10072e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100732:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100736:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10073a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10073e:	eb e9                	jmp    100729 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  100740:	49 89 cf             	mov    %rcx,%r15
  100743:	b8 01 00 00 00       	mov    $0x1,%eax
  100748:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  10074e:	e9 8f 00 00 00       	jmp    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100753:	49 89 cf             	mov    %rcx,%r15
  100756:	b8 00 00 00 00       	mov    $0x0,%eax
  10075b:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  100761:	eb 7f                	jmp    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100763:	b8 00 00 00 00       	mov    $0x0,%eax
  100768:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  10076e:	eb 72                	jmp    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100770:	b8 00 00 00 00       	mov    $0x0,%eax
  100775:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  10077b:	eb 65                	jmp    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10077d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100781:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100785:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100789:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10078d:	eb 6d                	jmp    1007fc <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  10078f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100793:	8b 07                	mov    (%rdi),%eax
  100795:	83 f8 2f             	cmp    $0x2f,%eax
  100798:	77 10                	ja     1007aa <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  10079a:	89 c2                	mov    %eax,%edx
  10079c:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007a0:	83 c0 08             	add    $0x8,%eax
  1007a3:	89 07                	mov    %eax,(%rdi)
  1007a5:	44 8b 12             	mov    (%rdx),%r10d
  1007a8:	eb 55                	jmp    1007ff <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  1007aa:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007ae:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007b2:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007b6:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007ba:	eb e9                	jmp    1007a5 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  1007bc:	49 89 cf             	mov    %rcx,%r15
  1007bf:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c4:	eb 16                	jmp    1007dc <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1007c6:	49 89 cf             	mov    %rcx,%r15
  1007c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1007ce:	eb 0c                	jmp    1007dc <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1007d0:	b8 00 00 00 00       	mov    $0x0,%eax
  1007d5:	eb 05                	jmp    1007dc <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1007d7:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1007dc:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1007e2:	85 c0                	test   %eax,%eax
  1007e4:	74 a9                	je     10078f <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  1007e6:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007ea:	8b 01                	mov    (%rcx),%eax
  1007ec:	83 f8 2f             	cmp    $0x2f,%eax
  1007ef:	77 8c                	ja     10077d <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  1007f1:	89 c2                	mov    %eax,%edx
  1007f3:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007f7:	83 c0 08             	add    $0x8,%eax
  1007fa:	89 01                	mov    %eax,(%rcx)
  1007fc:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  1007ff:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  100803:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  100806:	41 b9 e0 17 10 00    	mov    $0x1017e0,%r9d
    if (base < 0) {
  10080c:	45 85 c0             	test   %r8d,%r8d
  10080f:	79 0c                	jns    10081d <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  100811:	45 89 c3             	mov    %r8d,%r11d
  100814:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  100817:	41 b9 c0 17 10 00    	mov    $0x1017c0,%r9d
    *--pos = '\0';
  10081d:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100821:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  100825:	0f 84 49 03 00 00    	je     100b74 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  10082b:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  100832:	41 83 f8 0a          	cmp    $0xa,%r8d
  100836:	0f 94 c0             	sete   %al
  100839:	0f b6 c0             	movzbl %al,%eax
  10083c:	48 83 e8 04          	sub    $0x4,%rax
  100840:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100845:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100849:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  10084c:	49 63 f0             	movslq %r8d,%rsi
  10084f:	e9 5d 03 00 00       	jmp    100bb1 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  100854:	49 89 cf             	mov    %rcx,%r15
  100857:	b8 01 00 00 00       	mov    $0x1,%eax
  10085c:	eb 16                	jmp    100874 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  10085e:	49 89 cf             	mov    %rcx,%r15
  100861:	b8 00 00 00 00       	mov    $0x0,%eax
  100866:	eb 0c                	jmp    100874 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  100868:	b8 00 00 00 00       	mov    $0x0,%eax
  10086d:	eb 05                	jmp    100874 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  10086f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100874:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  10087a:	e9 63 ff ff ff       	jmp    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  10087f:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  100882:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100886:	8b 01                	mov    (%rcx),%eax
  100888:	83 f8 2f             	cmp    $0x2f,%eax
  10088b:	77 25                	ja     1008b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  10088d:	89 c2                	mov    %eax,%edx
  10088f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100893:	83 c0 08             	add    $0x8,%eax
  100896:	89 01                	mov    %eax,(%rcx)
  100898:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  10089b:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  1008a2:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  1008a8:	e9 64 ff ff ff       	jmp    100811 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  1008ad:	49 89 cf             	mov    %rcx,%r15
  1008b0:	eb d0                	jmp    100882 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  1008b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008c2:	eb d4                	jmp    100898 <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  1008c4:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  1008c7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008cb:	8b 07                	mov    (%rdi),%eax
  1008cd:	83 f8 2f             	cmp    $0x2f,%eax
  1008d0:	0f 87 c6 01 00 00    	ja     100a9c <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  1008d6:	89 c2                	mov    %eax,%edx
  1008d8:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008dc:	83 c0 08             	add    $0x8,%eax
  1008df:	89 07                	mov    %eax,(%rdi)
  1008e1:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  1008e4:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  1008ea:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1008ed:	83 e0 40             	and    $0x40,%eax
  1008f0:	89 45 98             	mov    %eax,-0x68(%rbp)
  1008f3:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  1008f9:	0f 85 d0 03 00 00    	jne    100ccf <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1008ff:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100902:	89 45 8c             	mov    %eax,-0x74(%rbp)
  100905:	25 c0 00 00 00       	and    $0xc0,%eax
  10090a:	3d c0 00 00 00       	cmp    $0xc0,%eax
  10090f:	0f 84 c4 02 00 00    	je     100bd9 <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100915:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100918:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  10091b:	bb d5 10 10 00       	mov    $0x1010d5,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100920:	83 f8 41             	cmp    $0x41,%eax
  100923:	0f 84 e6 02 00 00    	je     100c0f <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100929:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  10092c:	89 c8                	mov    %ecx,%eax
  10092e:	f7 d0                	not    %eax
  100930:	c1 e8 1f             	shr    $0x1f,%eax
  100933:	89 45 88             	mov    %eax,-0x78(%rbp)
  100936:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  10093a:	0f 85 0a 03 00 00    	jne    100c4a <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  100940:	84 c0                	test   %al,%al
  100942:	0f 84 02 03 00 00    	je     100c4a <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  100948:	48 63 f1             	movslq %ecx,%rsi
  10094b:	4c 89 e7             	mov    %r12,%rdi
  10094e:	e8 3b fa ff ff       	call   10038e <strnlen>
  100953:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  100956:	8b 45 8c             	mov    -0x74(%rbp),%eax
  100959:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  10095c:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100963:	83 f8 42             	cmp    $0x42,%eax
  100966:	0f 84 16 03 00 00    	je     100c82 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  10096c:	48 89 df             	mov    %rbx,%rdi
  10096f:	e8 fb f9 ff ff       	call   10036f <strlen>
  100974:	8b 55 a8             	mov    -0x58(%rbp),%edx
  100977:	03 55 9c             	add    -0x64(%rbp),%edx
  10097a:	44 89 e9             	mov    %r13d,%ecx
  10097d:	29 d1                	sub    %edx,%ecx
  10097f:	29 c1                	sub    %eax,%ecx
  100981:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  100984:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100987:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  10098b:	75 39                	jne    1009c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  10098d:	85 c9                	test   %ecx,%ecx
  10098f:	7e 35                	jle    1009c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  100991:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  100995:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  100998:	49 8b 06             	mov    (%r14),%rax
  10099b:	89 da                	mov    %ebx,%edx
  10099d:	be 20 00 00 00       	mov    $0x20,%esi
  1009a2:	4c 89 f7             	mov    %r14,%rdi
  1009a5:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1009a7:	41 83 ed 01          	sub    $0x1,%r13d
  1009ab:	45 85 ed             	test   %r13d,%r13d
  1009ae:	7f e8                	jg     100998 <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  1009b0:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  1009b4:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1009b7:	85 ff                	test   %edi,%edi
  1009b9:	b8 01 00 00 00       	mov    $0x1,%eax
  1009be:	0f 4f c7             	cmovg  %edi,%eax
  1009c1:	29 c7                	sub    %eax,%edi
  1009c3:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  1009c6:	0f b6 03             	movzbl (%rbx),%eax
  1009c9:	84 c0                	test   %al,%al
  1009cb:	74 25                	je     1009f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  1009cd:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1009d1:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  1009d5:	0f b6 f0             	movzbl %al,%esi
  1009d8:	49 8b 06             	mov    (%r14),%rax
  1009db:	44 89 e2             	mov    %r12d,%edx
  1009de:	4c 89 f7             	mov    %r14,%rdi
  1009e1:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1009e3:	48 83 c3 01          	add    $0x1,%rbx
  1009e7:	0f b6 03             	movzbl (%rbx),%eax
  1009ea:	84 c0                	test   %al,%al
  1009ec:	75 e7                	jne    1009d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  1009ee:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  1009f2:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  1009f5:	85 db                	test   %ebx,%ebx
  1009f7:	7e 21                	jle    100a1a <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  1009f9:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1009fd:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  100a01:	49 8b 06             	mov    (%r14),%rax
  100a04:	44 89 e2             	mov    %r12d,%edx
  100a07:	be 30 00 00 00       	mov    $0x30,%esi
  100a0c:	4c 89 f7             	mov    %r14,%rdi
  100a0f:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100a11:	83 eb 01             	sub    $0x1,%ebx
  100a14:	75 eb                	jne    100a01 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  100a16:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  100a1a:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100a1d:	85 c0                	test   %eax,%eax
  100a1f:	7e 2a                	jle    100a4b <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  100a21:	89 c3                	mov    %eax,%ebx
  100a23:	4c 01 e3             	add    %r12,%rbx
  100a26:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  100a2a:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  100a2e:	41 0f b6 34 24       	movzbl (%r12),%esi
  100a33:	49 8b 06             	mov    (%r14),%rax
  100a36:	44 89 ea             	mov    %r13d,%edx
  100a39:	4c 89 f7             	mov    %r14,%rdi
  100a3c:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100a3e:	49 83 c4 01          	add    $0x1,%r12
  100a42:	4c 39 e3             	cmp    %r12,%rbx
  100a45:	75 e7                	jne    100a2e <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  100a47:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  100a4b:	45 85 ed             	test   %r13d,%r13d
  100a4e:	7e 18                	jle    100a68 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  100a50:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  100a53:	49 8b 06             	mov    (%r14),%rax
  100a56:	89 da                	mov    %ebx,%edx
  100a58:	be 20 00 00 00       	mov    $0x20,%esi
  100a5d:	4c 89 f7             	mov    %r14,%rdi
  100a60:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100a62:	41 83 ed 01          	sub    $0x1,%r13d
  100a66:	75 eb                	jne    100a53 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  100a68:	4d 8d 67 01          	lea    0x1(%r15),%r12
  100a6c:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  100a71:	84 c0                	test   %al,%al
  100a73:	0f 84 34 fa ff ff    	je     1004ad <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  100a79:	3c 25                	cmp    $0x25,%al
  100a7b:	0f 84 3b fa ff ff    	je     1004bc <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  100a81:	0f b6 f0             	movzbl %al,%esi
  100a84:	49 8b 06             	mov    (%r14),%rax
  100a87:	8b 55 ac             	mov    -0x54(%rbp),%edx
  100a8a:	4c 89 f7             	mov    %r14,%rdi
  100a8d:	ff 10                	call   *(%rax)
            continue;
  100a8f:	4d 89 e7             	mov    %r12,%r15
  100a92:	eb d4                	jmp    100a68 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  100a94:	49 89 cf             	mov    %rcx,%r15
  100a97:	e9 2b fe ff ff       	jmp    1008c7 <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  100a9c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100aa0:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100aa4:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100aa8:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100aac:	e9 30 fe ff ff       	jmp    1008e1 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  100ab1:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  100ab4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100ab8:	8b 01                	mov    (%rcx),%eax
  100aba:	83 f8 2f             	cmp    $0x2f,%eax
  100abd:	77 17                	ja     100ad6 <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  100abf:	89 c2                	mov    %eax,%edx
  100ac1:	48 03 51 10          	add    0x10(%rcx),%rdx
  100ac5:	83 c0 08             	add    $0x8,%eax
  100ac8:	89 01                	mov    %eax,(%rcx)
  100aca:	8b 02                	mov    (%rdx),%eax
  100acc:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  100acf:	eb 97                	jmp    100a68 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  100ad1:	49 89 cf             	mov    %rcx,%r15
  100ad4:	eb de                	jmp    100ab4 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  100ad6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100ada:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100ade:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100ae2:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100ae6:	eb e2                	jmp    100aca <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  100ae8:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  100aeb:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100aef:	8b 07                	mov    (%rdi),%eax
  100af1:	83 f8 2f             	cmp    $0x2f,%eax
  100af4:	77 28                	ja     100b1e <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  100af6:	89 c2                	mov    %eax,%edx
  100af8:	48 03 57 10          	add    0x10(%rdi),%rdx
  100afc:	83 c0 08             	add    $0x8,%eax
  100aff:	89 07                	mov    %eax,(%rdi)
  100b01:	8b 02                	mov    (%rdx),%eax
  100b03:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100b06:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100b0a:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100b0e:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  100b14:	e9 d1 fd ff ff       	jmp    1008ea <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  100b19:	49 89 cf             	mov    %rcx,%r15
  100b1c:	eb cd                	jmp    100aeb <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  100b1e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100b22:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100b26:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b2a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100b2e:	eb d1                	jmp    100b01 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  100b30:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  100b33:	84 c0                	test   %al,%al
  100b35:	0f 85 6f 01 00 00    	jne    100caa <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  100b3b:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100b3f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100b43:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  100b47:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100b4b:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100b51:	e9 94 fd ff ff       	jmp    1008ea <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  100b56:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100b5c:	41 b9 e0 17 10 00    	mov    $0x1017e0,%r9d
    if (flags & FLAG_THOUSANDS) {
  100b62:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b68:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100b6f:	e9 cc fc ff ff       	jmp    100840 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  100b74:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100b7b:	bf 00 00 00 00       	mov    $0x0,%edi
  100b80:	e9 c0 fc ff ff       	jmp    100845 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  100b85:	49 89 cc             	mov    %rcx,%r12
  100b88:	ba 00 00 00 00       	mov    $0x0,%edx
  100b8d:	48 f7 f6             	div    %rsi
  100b90:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  100b95:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100b97:	48 83 e9 01          	sub    $0x1,%rcx
  100b9b:	48 85 c0             	test   %rax,%rax
  100b9e:	0f 84 5b fd ff ff    	je     1008ff <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  100ba4:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  100ba8:	49 39 d4             	cmp    %rdx,%r12
  100bab:	0f 84 4e fd ff ff    	je     1008ff <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  100bb1:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100bb5:	48 39 d7             	cmp    %rdx,%rdi
  100bb8:	75 cb                	jne    100b85 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  100bba:	49 89 cc             	mov    %rcx,%r12
  100bbd:	41 83 f8 0a          	cmp    $0xa,%r8d
  100bc1:	0f 94 c2             	sete   %dl
  100bc4:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100bc8:	40 0f 94 c7          	sete   %dil
  100bcc:	40 0f b6 ff          	movzbl %dil,%edi
  100bd0:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100bd2:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100bd7:	eb be                	jmp    100b97 <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  100bd9:	bb ed 10 10 00       	mov    $0x1010ed,%ebx
            if (flags & FLAG_NEGATIVE) {
  100bde:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100be1:	f6 c4 01             	test   $0x1,%ah
  100be4:	0f 85 3f fd ff ff    	jne    100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  100bea:	bb e8 10 10 00       	mov    $0x1010e8,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100bef:	a8 10                	test   $0x10,%al
  100bf1:	0f 85 32 fd ff ff    	jne    100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  100bf7:	a8 08                	test   $0x8,%al
  100bf9:	ba d5 10 10 00       	mov    $0x1010d5,%edx
  100bfe:	b8 ef 10 10 00       	mov    $0x1010ef,%eax
  100c03:	48 0f 44 c2          	cmove  %rdx,%rax
  100c07:	48 89 c3             	mov    %rax,%rbx
  100c0a:	e9 1a fd ff ff       	jmp    100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  100c0f:	41 8d 43 10          	lea    0x10(%r11),%eax
  100c13:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100c18:	0f 85 0b fd ff ff    	jne    100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  100c1e:	4d 85 d2             	test   %r10,%r10
  100c21:	75 0d                	jne    100c30 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  100c23:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  100c2a:	0f 84 f9 fc ff ff    	je     100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  100c30:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  100c34:	ba f1 10 10 00       	mov    $0x1010f1,%edx
  100c39:	b8 ea 10 10 00       	mov    $0x1010ea,%eax
  100c3e:	48 0f 44 c2          	cmove  %rdx,%rax
  100c42:	48 89 c3             	mov    %rax,%rbx
  100c45:	e9 df fc ff ff       	jmp    100929 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  100c4a:	4c 89 e7             	mov    %r12,%rdi
  100c4d:	e8 1d f7 ff ff       	call   10036f <strlen>
  100c52:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100c55:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100c59:	0f 84 f7 fc ff ff    	je     100956 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  100c5f:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  100c63:	0f 84 ed fc ff ff    	je     100956 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  100c69:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  100c6c:	89 ca                	mov    %ecx,%edx
  100c6e:	29 c2                	sub    %eax,%edx
  100c70:	39 c1                	cmp    %eax,%ecx
  100c72:	b8 00 00 00 00       	mov    $0x0,%eax
  100c77:	0f 4f c2             	cmovg  %edx,%eax
  100c7a:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100c7d:	e9 ea fc ff ff       	jmp    10096c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  100c82:	48 89 df             	mov    %rbx,%rdi
  100c85:	e8 e5 f6 ff ff       	call   10036f <strlen>
  100c8a:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100c8d:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100c90:	44 89 e9             	mov    %r13d,%ecx
  100c93:	29 f9                	sub    %edi,%ecx
  100c95:	29 c1                	sub    %eax,%ecx
  100c97:	44 39 ea             	cmp    %r13d,%edx
  100c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  100c9f:	0f 4c c1             	cmovl  %ecx,%eax
  100ca2:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100ca5:	e9 c2 fc ff ff       	jmp    10096c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  100caa:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  100cad:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100cb0:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100cb4:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100cb8:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100cbe:	e9 27 fc ff ff       	jmp    1008ea <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  100cc3:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  100cca:	e9 40 f8 ff ff       	jmp    10050f <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  100ccf:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100cd3:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  100cd7:	0f 85 79 fe ff ff    	jne    100b56 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  100cdd:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100ce3:	41 b9 e0 17 10 00    	mov    $0x1017e0,%r9d
    if (flags & FLAG_THOUSANDS) {
  100ce9:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  100cef:	bf 00 00 00 00       	mov    $0x0,%edi
  100cf4:	e9 4c fb ff ff       	jmp    100845 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  100cf9:	8d 50 bd             	lea    -0x43(%rax),%edx
  100cfc:	80 fa 35             	cmp    $0x35,%dl
  100cff:	77 ac                	ja     100cad <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  100d01:	0f b6 d2             	movzbl %dl,%edx
  100d04:	3e ff 24 d5 10 16 10 	notrack jmp *0x101610(,%rdx,8)
  100d0b:	00 

0000000000100d0c <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100d0c:	f3 0f 1e fa          	endbr64 
  100d10:	55                   	push   %rbp
  100d11:	48 89 e5             	mov    %rsp,%rbp
  100d14:	53                   	push   %rbx
  100d15:	48 83 ec 28          	sub    $0x28,%rsp
  100d19:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100d1c:	48 c7 45 d0 68 18 10 	movq   $0x101868,-0x30(%rbp)
  100d23:	00 
  100d24:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100d28:	48 01 f7             	add    %rsi,%rdi
  100d2b:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100d2f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100d36:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100d37:	be 00 00 00 00       	mov    $0x0,%esi
  100d3c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100d40:	e8 3b f7 ff ff       	call   100480 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100d45:	48 85 db             	test   %rbx,%rbx
  100d48:	74 16                	je     100d60 <vsnprintf+0x54>
  100d4a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100d4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100d52:	48 39 c2             	cmp    %rax,%rdx
  100d55:	73 05                	jae    100d5c <vsnprintf+0x50>
        *sp.s_ = 0;
  100d57:	c6 02 00             	movb   $0x0,(%rdx)
  100d5a:	eb 04                	jmp    100d60 <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  100d5c:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  100d60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100d64:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100d68:	c9                   	leave  
  100d69:	c3                   	ret    

0000000000100d6a <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100d6a:	f3 0f 1e fa          	endbr64 
  100d6e:	55                   	push   %rbp
  100d6f:	48 89 e5             	mov    %rsp,%rbp
  100d72:	48 83 ec 50          	sub    $0x50,%rsp
  100d76:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100d7a:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100d7e:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100d82:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100d89:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100d8d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100d91:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100d95:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100d99:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100d9d:	e8 6a ff ff ff       	call   100d0c <vsnprintf>
    va_end(val);
    return n;
  100da2:	48 98                	cltq   
}
  100da4:	c9                   	leave  
  100da5:	c3                   	ret    

0000000000100da6 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  100da6:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  100daa:	48 c7 07 80 18 10 00 	movq   $0x101880,(%rdi)
  100db1:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100db8:	00 
  100db9:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  100dbc:	85 f6                	test   %esi,%esi
  100dbe:	78 18                	js     100dd8 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100dc0:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100dc6:	7f 0f                	jg     100dd7 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  100dc8:	48 63 f6             	movslq %esi,%rsi
  100dcb:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100dd2:	00 
  100dd3:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  100dd7:	c3                   	ret    
        cell_ += cursorpos;
  100dd8:	8b 05 1e 82 fb ff    	mov    -0x47de2(%rip),%eax        # b8ffc <cursorpos>
  100dde:	48 98                	cltq   
  100de0:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100de7:	00 
  100de8:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100dec:	c3                   	ret    
  100ded:	90                   	nop

0000000000100dee <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100dee:	f3 0f 1e fa          	endbr64 
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100df2:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  100df9:	00 
  100dfa:	72 56                	jb     100e52 <console_printer::scroll()+0x64>
    if (scroll_) {
  100dfc:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100e01:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  100e05:	74 46                	je     100e4d <console_printer::scroll()+0x5f>
        int i = 0;
  100e07:	b8 00 00 00 00       	mov    $0x0,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
            console[i] = console[i + CONSOLE_COLUMNS];
  100e0c:	8d 50 50             	lea    0x50(%rax),%edx
  100e0f:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
  100e14:	48 63 d2             	movslq %edx,%rdx
  100e17:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
  100e1b:	48 63 d0             	movslq %eax,%rdx
  100e1e:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
            ++i;
  100e22:	83 c0 01             	add    $0x1,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
  100e25:	3d 80 07 00 00       	cmp    $0x780,%eax
  100e2a:	75 e0                	jne    100e0c <console_printer::scroll()+0x1e>
        }
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
            console[i] = 0;
  100e2c:	48 63 d0             	movslq %eax,%rdx
  100e2f:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
  100e36:	00 00 00 
            ++i;
  100e39:	83 c0 01             	add    $0x1,%eax
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e3c:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100e41:	75 e9                	jne    100e2c <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
  100e43:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100e47:	48 2d a0 00 00 00    	sub    $0xa0,%rax
  100e4d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100e51:	c3                   	ret    
void console_printer::scroll() {
  100e52:	55                   	push   %rbp
  100e53:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100e56:	b9 00 00 00 00       	mov    $0x0,%ecx
  100e5b:	ba f8 17 10 00       	mov    $0x1017f8,%edx
  100e60:	be 80 02 00 00       	mov    $0x280,%esi
  100e65:	bf e1 10 10 00       	mov    $0x1010e1,%edi
  100e6a:	e8 72 01 00 00       	call   100fe1 <assert_fail(char const*, int, char const*, char const*)>
  100e6f:	90                   	nop

0000000000100e70 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  100e70:	f3 0f 1e fa          	endbr64 
  100e74:	55                   	push   %rbp
  100e75:	48 89 e5             	mov    %rsp,%rbp
  100e78:	41 55                	push   %r13
  100e7a:	41 54                	push   %r12
  100e7c:	53                   	push   %rbx
  100e7d:	48 83 ec 08          	sub    $0x8,%rsp
  100e81:	48 89 fb             	mov    %rdi,%rbx
  100e84:	41 89 f5             	mov    %esi,%r13d
  100e87:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e8a:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100e8e:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100e94:	72 14                	jb     100eaa <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  100e96:	48 89 df             	mov    %rbx,%rdi
  100e99:	e8 50 ff ff ff       	call   100dee <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e9e:	48 8b 43 08          	mov    0x8(%rbx),%rax
  100ea2:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100ea8:	73 ec                	jae    100e96 <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  100eaa:	41 80 fd 0a          	cmp    $0xa,%r13b
  100eae:	74 1e                	je     100ece <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  100eb0:	45 0f b6 ed          	movzbl %r13b,%r13d
  100eb4:	45 09 e5             	or     %r12d,%r13d
  100eb7:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100ebb:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  100ebf:	66 44 89 28          	mov    %r13w,(%rax)
    }
}
  100ec3:	48 83 c4 08          	add    $0x8,%rsp
  100ec7:	5b                   	pop    %rbx
  100ec8:	41 5c                	pop    %r12
  100eca:	41 5d                	pop    %r13
  100ecc:	5d                   	pop    %rbp
  100ecd:	c3                   	ret    
        int pos = (cell_ - console) % 80;
  100ece:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100ed4:	48 89 c1             	mov    %rax,%rcx
  100ed7:	48 89 c6             	mov    %rax,%rsi
  100eda:	48 d1 fe             	sar    %rsi
  100edd:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100ee4:	66 66 66 
  100ee7:	48 89 f0             	mov    %rsi,%rax
  100eea:	48 f7 ea             	imul   %rdx
  100eed:	48 c1 fa 05          	sar    $0x5,%rdx
  100ef1:	48 89 c8             	mov    %rcx,%rax
  100ef4:	48 c1 f8 3f          	sar    $0x3f,%rax
  100ef8:	48 29 c2             	sub    %rax,%rdx
  100efb:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  100eff:	48 c1 e2 04          	shl    $0x4,%rdx
  100f03:	89 f0                	mov    %esi,%eax
  100f05:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color;
  100f07:	41 83 cc 20          	or     $0x20,%r12d
  100f0b:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  100f0f:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  100f13:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
  100f17:	66 44 89 22          	mov    %r12w,(%rdx)
            ++pos;
  100f1b:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100f1e:	83 f8 50             	cmp    $0x50,%eax
  100f21:	75 e8                	jne    100f0b <console_printer::putc(unsigned char, int)+0x9b>
  100f23:	eb 9e                	jmp    100ec3 <console_printer::putc(unsigned char, int)+0x53>
  100f25:	90                   	nop

0000000000100f26 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100f26:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  100f2a:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100f2e:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100f34:	48 d1 f8             	sar    %rax
  100f37:	89 05 bf 80 fb ff    	mov    %eax,-0x47f41(%rip)        # b8ffc <cursorpos>
}
  100f3d:	c3                   	ret    

0000000000100f3e <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100f3e:	f3 0f 1e fa          	endbr64 
  100f42:	55                   	push   %rbp
  100f43:	48 89 e5             	mov    %rsp,%rbp
  100f46:	41 56                	push   %r14
  100f48:	41 55                	push   %r13
  100f4a:	41 54                	push   %r12
  100f4c:	53                   	push   %rbx
  100f4d:	48 83 ec 20          	sub    $0x20,%rsp
  100f51:	89 fb                	mov    %edi,%ebx
  100f53:	41 89 f4             	mov    %esi,%r12d
  100f56:	49 89 d5             	mov    %rdx,%r13
  100f59:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  100f5c:	89 fa                	mov    %edi,%edx
  100f5e:	c1 ea 1f             	shr    $0x1f,%edx
  100f61:	89 fe                	mov    %edi,%esi
  100f63:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100f67:	e8 3a fe ff ff       	call   100da6 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  100f6c:	4c 89 f1             	mov    %r14,%rcx
  100f6f:	4c 89 ea             	mov    %r13,%rdx
  100f72:	44 89 e6             	mov    %r12d,%esi
  100f75:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100f79:	e8 02 f5 ff ff       	call   100480 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  100f7e:	85 db                	test   %ebx,%ebx
  100f80:	78 1a                	js     100f9c <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  100f82:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  100f86:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100f8c:	48 d1 f8             	sar    %rax
}
  100f8f:	48 83 c4 20          	add    $0x20,%rsp
  100f93:	5b                   	pop    %rbx
  100f94:	41 5c                	pop    %r12
  100f96:	41 5d                	pop    %r13
  100f98:	41 5e                	pop    %r14
  100f9a:	5d                   	pop    %rbp
  100f9b:	c3                   	ret    
        cp.move_cursor();
  100f9c:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100fa0:	e8 81 ff ff ff       	call   100f26 <console_printer::move_cursor()>
  100fa5:	eb db                	jmp    100f82 <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000100fa7 <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
  100fa7:	f3 0f 1e fa          	endbr64 
  100fab:	55                   	push   %rbp
  100fac:	48 89 e5             	mov    %rsp,%rbp
  100faf:	48 83 ec 50          	sub    $0x50,%rsp
  100fb3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100fb7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100fbb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100fbf:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100fc6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100fca:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100fce:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100fd2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  100fd6:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100fda:	e8 5f ff ff ff       	call   100f3e <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
  100fdf:	c9                   	leave  
  100fe0:	c3                   	ret    

0000000000100fe1 <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100fe1:	f3 0f 1e fa          	endbr64 
  100fe5:	55                   	push   %rbp
  100fe6:	48 89 e5             	mov    %rsp,%rbp
  100fe9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100ff0:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100ff3:	c7 05 ff 7f fb ff 30 	movl   $0x730,-0x48001(%rip)        # b8ffc <cursorpos>
  100ffa:	07 00 00 
    char buf[240];
    if (description) {
  100ffd:	48 85 c9             	test   %rcx,%rcx
  101000:	74 39                	je     10103b <assert_fail(char const*, int, char const*, char const*)+0x5a>
  101002:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  101005:	48 83 ec 08          	sub    $0x8,%rsp
  101009:	52                   	push   %rdx
  10100a:	56                   	push   %rsi
  10100b:	57                   	push   %rdi
  10100c:	48 89 f9             	mov    %rdi,%rcx
  10100f:	ba 88 18 10 00       	mov    $0x101888,%edx
  101014:	be f0 00 00 00       	mov    $0xf0,%esi
  101019:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101020:	b0 00                	mov    $0x0,%al
  101022:	e8 43 fd ff ff       	call   100d6a <snprintf>
  101027:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  10102b:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  101030:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101037:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  101039:	eb fe                	jmp    101039 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  10103b:	49 89 d1             	mov    %rdx,%r9
  10103e:	48 89 f9             	mov    %rdi,%rcx
  101041:	ba b8 18 10 00       	mov    $0x1018b8,%edx
  101046:	be f0 00 00 00       	mov    $0xf0,%esi
  10104b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101052:	b0 00                	mov    $0x0,%al
  101054:	e8 11 fd ff ff       	call   100d6a <snprintf>
  101059:	eb d0                	jmp    10102b <assert_fail(char const*, int, char const*, char const*)+0x4a>
