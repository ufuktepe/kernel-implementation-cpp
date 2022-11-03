
obj/p-fork.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:
    int field2;
};
const test_struct test1 = {61, {0}, 6161};
test_struct test2;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 56                	push   %r14
  10000a:	41 55                	push   %r13
  10000c:	41 54                	push   %r12
  10000e:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000f:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100014:	0f 05                	syscall 
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  100016:	49 89 c5             	mov    %rax,%r13
    pid_t initial_pid = sys_getpid();
    test2.field1 = 61;
  100019:	c7 05 dd 1f 00 00 3d 	movl   $0x3d,0x1fdd(%rip)        # 102000 <test2>
  100020:	00 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  100023:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100028:	0f 05                	syscall 
    return rax;
  10002a:	49 89 c6             	mov    %rax,%r14
    register uintptr_t rax asm("rax") = syscallno;
  10002d:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100032:	0f 05                	syscall 
    return rax;
  100034:	48 89 c3             	mov    %rax,%rbx
    assert(test1.field1 == 61 && test1.field2 == 6161);

    // Fork a total of three new copies, checking `fork` return values.
    pid_t p1 = sys_fork();
    pid_t intermediate_pid = sys_getpid();
    if (p1 == 0) {
  100037:	45 85 f6             	test   %r14d,%r14d
  10003a:	0f 85 c2 00 00 00    	jne    100102 <process_main()+0x102>
        assert(intermediate_pid != initial_pid);
  100040:	41 39 c5             	cmp    %eax,%r13d
  100043:	0f 84 a0 00 00 00    	je     1000e9 <process_main()+0xe9>
    register uintptr_t rax asm("rax") = syscallno;
  100049:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10004e:	0f 05                	syscall 
    return rax;
  100050:	49 89 c4             	mov    %rax,%r12
    register uintptr_t rax asm("rax") = syscallno;
  100053:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100058:	0f 05                	syscall 
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
    }

    pid_t p2 = sys_fork();
    pid_t final_pid = sys_getpid();
    if (p2 == 0) {
  10005a:	45 85 e4             	test   %r12d,%r12d
  10005d:	0f 85 df 00 00 00    	jne    100142 <process_main()+0x142>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100063:	41 39 c5             	cmp    %eax,%r13d
  100066:	0f 84 bd 00 00 00    	je     100129 <process_main()+0x129>
  10006c:	39 c3                	cmp    %eax,%ebx
  10006e:	0f 84 b5 00 00 00    	je     100129 <process_main()+0x129>
        assert(final_pid == intermediate_pid);
    }

    // Check that multi-page segments can be loaded.
    assert(test1.field1 == 61 && test1.field2 == 6161);
    assert(test2.field1 == 61);
  100074:	83 3d 85 1f 00 00 3d 	cmpl   $0x3d,0x1f85(%rip)        # 102000 <test2>
  10007b:	0f 85 10 01 00 00    	jne    100191 <process_main()+0x191>
    test2.field2 = 61 + final_pid;
  100081:	8d 58 3d             	lea    0x3d(%rax),%ebx
  100084:	89 1d 7a 2f 00 00    	mov    %ebx,0x2f7a(%rip)        # 103004 <test2+0x1004>
    register uintptr_t rax asm("rax") = syscallno;
  10008a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10008f:	0f 05                	syscall 
    sys_yield();
    assert(test2.field2 == 61 + final_pid);
  100091:	3b 1d 6d 2f 00 00    	cmp    0x2f6d(%rip),%ebx        # 103004 <test2+0x1004>
  100097:	0f 85 0d 01 00 00    	jne    1001aa <process_main()+0x1aa>
    register uintptr_t rax asm("rax") = syscallno;
  10009d:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000a2:	0f 05                	syscall 
    return rax;
  1000a4:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1000a7:	89 c3                	mov    %eax,%ebx

    // The rest of this code is like p-allocator.c.

    pid_t p = sys_getpid();
    srand(p);
  1000a9:	89 c7                	mov    %eax,%edi
  1000ab:	e8 ae 02 00 00       	call   10035e <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000b0:	41 bd 23 40 10 00    	mov    $0x104023,%r13d
  1000b6:	49 81 e5 00 f0 ff ff 	and    $0xfffffffffffff000,%r13

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
    heap_top = heap_bottom;
  1000bd:	4c 89 2d 4c 2f 00 00 	mov    %r13,0x2f4c(%rip)        # 103010 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000c4:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000c7:	48 83 e8 01          	sub    $0x1,%rax
  1000cb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000d1:	48 89 05 30 2f 00 00 	mov    %rax,0x2f30(%rip)        # 103008 <stack_bottom>

    while (heap_top != stack_bottom) {
  1000d8:	4c 39 e8             	cmp    %r13,%rax
  1000db:	0f 84 91 01 00 00    	je     100272 <process_main()+0x272>
            console[CPOS(24, 79)] = p;
            // update `heap_top`
            heap_top += PAGESIZE;
        } else if (x < p + 1 && heap_bottom < heap_top) {
            // ensure we can write to any previously-allocated page
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  1000e1:	45 89 ee             	mov    %r13d,%r14d
  1000e4:	e9 3d 01 00 00       	jmp    100226 <process_main()+0x226>
        assert(intermediate_pid != initial_pid);
  1000e9:	b9 00 00 00 00       	mov    $0x0,%ecx
  1000ee:	ba 70 0d 10 00       	mov    $0x100d70,%edx
  1000f3:	be 1d 00 00 00       	mov    $0x1d,%esi
  1000f8:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  1000fd:	e8 f0 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
  100102:	41 39 c5             	cmp    %eax,%r13d
  100105:	75 09                	jne    100110 <process_main()+0x110>
  100107:	45 39 f5             	cmp    %r14d,%r13d
  10010a:	0f 85 39 ff ff ff    	jne    100049 <process_main()+0x49>
  100110:	b9 00 00 00 00       	mov    $0x0,%ecx
  100115:	ba 90 0d 10 00       	mov    $0x100d90,%edx
  10011a:	be 1f 00 00 00       	mov    $0x1f,%esi
  10011f:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  100124:	e8 c9 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100129:	b9 00 00 00 00       	mov    $0x0,%ecx
  10012e:	ba c8 0d 10 00       	mov    $0x100dc8,%edx
  100133:	be 25 00 00 00       	mov    $0x25,%esi
  100138:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  10013d:	e8 b0 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  100142:	45 39 e6             	cmp    %r12d,%r14d
  100145:	0f 94 c2             	sete   %dl
  100148:	44 39 e3             	cmp    %r12d,%ebx
  10014b:	0f 94 c1             	sete   %cl
  10014e:	08 ca                	or     %cl,%dl
  100150:	75 26                	jne    100178 <process_main()+0x178>
  100152:	45 39 e5             	cmp    %r12d,%r13d
  100155:	74 21                	je     100178 <process_main()+0x178>
        assert(final_pid == intermediate_pid);
  100157:	39 c3                	cmp    %eax,%ebx
  100159:	0f 84 15 ff ff ff    	je     100074 <process_main()+0x74>
  10015f:	b9 00 00 00 00       	mov    $0x0,%ecx
  100164:	ba 69 0e 10 00       	mov    $0x100e69,%edx
  100169:	be 28 00 00 00       	mov    $0x28,%esi
  10016e:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  100173:	e8 7a 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  100178:	b9 00 00 00 00       	mov    $0x0,%ecx
  10017d:	ba 08 0e 10 00       	mov    $0x100e08,%edx
  100182:	be 27 00 00 00       	mov    $0x27,%esi
  100187:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  10018c:	e8 61 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field1 == 61);
  100191:	b9 00 00 00 00       	mov    $0x0,%ecx
  100196:	ba 87 0e 10 00       	mov    $0x100e87,%edx
  10019b:	be 2d 00 00 00       	mov    $0x2d,%esi
  1001a0:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  1001a5:	e8 48 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field2 == 61 + final_pid);
  1001aa:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001af:	ba 40 0e 10 00       	mov    $0x100e40,%edx
  1001b4:	be 30 00 00 00       	mov    $0x30,%esi
  1001b9:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  1001be:	e8 2f 0b 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  1001c3:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1001c8:	48 8b 3d 41 2e 00 00 	mov    0x2e41(%rip),%rdi        # 103010 <heap_top>
  1001cf:	0f 05                	syscall 
            if (sys_page_alloc(heap_top) < 0) {
  1001d1:	85 c0                	test   %eax,%eax
  1001d3:	0f 88 99 00 00 00    	js     100272 <process_main()+0x272>
            for (unsigned long* l = (unsigned long*) heap_top;
  1001d9:	48 8b 0d 30 2e 00 00 	mov    0x2e30(%rip),%rcx        # 103010 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1001e0:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1001e7:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1001ea:	48 83 38 00          	cmpq   $0x0,(%rax)
  1001ee:	75 69                	jne    100259 <process_main()+0x259>
            for (unsigned long* l = (unsigned long*) heap_top;
  1001f0:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1001f4:	48 39 d0             	cmp    %rdx,%rax
  1001f7:	75 f1                	jne    1001ea <process_main()+0x1ea>
            *heap_top = p;
  1001f9:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1001fc:	66 44 89 25 9a 8d fb 	mov    %r12w,-0x47266(%rip)        # b8f9e <console+0xf9e>
  100203:	ff 
            heap_top += PAGESIZE;
  100204:	48 81 05 01 2e 00 00 	addq   $0x1000,0x2e01(%rip)        # 103010 <heap_top>
  10020b:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  10020f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100214:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  100216:	48 8b 05 eb 2d 00 00 	mov    0x2deb(%rip),%rax        # 103008 <stack_bottom>
  10021d:	48 39 05 ec 2d 00 00 	cmp    %rax,0x2dec(%rip)        # 103010 <heap_top>
  100224:	74 4c                	je     100272 <process_main()+0x272>
        int x = rand(0, ALLOC_SLOWDOWN - 1);
  100226:	be 09 00 00 00       	mov    $0x9,%esi
  10022b:	bf 00 00 00 00       	mov    $0x0,%edi
  100230:	e8 48 01 00 00       	call   10037d <rand(int, int)>
        if (x < p) {
  100235:	39 d8                	cmp    %ebx,%eax
  100237:	7c 8a                	jl     1001c3 <process_main()+0x1c3>
        } else if (x < p + 1 && heap_bottom < heap_top) {
  100239:	75 d4                	jne    10020f <process_main()+0x20f>
  10023b:	48 8b 05 ce 2d 00 00 	mov    0x2dce(%rip),%rax        # 103010 <heap_top>
  100242:	4c 39 e8             	cmp    %r13,%rax
  100245:	76 c8                	jbe    10020f <process_main()+0x20f>
                                  (uintptr_t) heap_top - 1);
  100247:	8d 70 ff             	lea    -0x1(%rax),%esi
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  10024a:	44 89 f7             	mov    %r14d,%edi
  10024d:	e8 2b 01 00 00       	call   10037d <rand(int, int)>
                                  (uintptr_t) heap_top - 1);
  100252:	48 98                	cltq   
            *((char*) addr) = p;
  100254:	44 88 20             	mov    %r12b,(%rax)
  100257:	eb b6                	jmp    10020f <process_main()+0x20f>
                assert(*l == 0);
  100259:	b9 00 00 00 00       	mov    $0x0,%ecx
  10025e:	ba 9a 0e 10 00       	mov    $0x100e9a,%edx
  100263:	be 45 00 00 00       	mov    $0x45,%esi
  100268:	bf 5f 0e 10 00       	mov    $0x100e5f,%edi
  10026d:	e8 80 0a 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  100272:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100277:	0f 05                	syscall 
    return rax;
  100279:	eb f7                	jmp    100272 <process_main()+0x272>
  10027b:	90                   	nop

000000000010027c <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  10027c:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  100280:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100284:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  100288:	73 0b                	jae    100295 <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  10028a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  10028e:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100292:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100295:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  10029a:	c3                   	ret    

000000000010029b <strlen>:
size_t strlen(const char* s) {
  10029b:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  10029f:	80 3f 00             	cmpb   $0x0,(%rdi)
  1002a2:	74 10                	je     1002b4 <strlen+0x19>
  1002a4:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1002a9:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1002ad:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1002b1:	75 f6                	jne    1002a9 <strlen+0xe>
  1002b3:	c3                   	ret    
  1002b4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1002b9:	c3                   	ret    

00000000001002ba <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1002ba:	f3 0f 1e fa          	endbr64 
  1002be:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002c1:	ba 00 00 00 00       	mov    $0x0,%edx
  1002c6:	48 85 f6             	test   %rsi,%rsi
  1002c9:	74 11                	je     1002dc <strnlen+0x22>
  1002cb:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1002cf:	74 0c                	je     1002dd <strnlen+0x23>
        ++n;
  1002d1:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002d5:	48 39 d0             	cmp    %rdx,%rax
  1002d8:	75 f1                	jne    1002cb <strnlen+0x11>
  1002da:	eb 04                	jmp    1002e0 <strnlen+0x26>
  1002dc:	c3                   	ret    
  1002dd:	48 89 d0             	mov    %rdx,%rax
}
  1002e0:	c3                   	ret    

00000000001002e1 <strchr>:
char* strchr(const char* s, int c) {
  1002e1:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  1002e5:	0f b6 07             	movzbl (%rdi),%eax
  1002e8:	84 c0                	test   %al,%al
  1002ea:	74 10                	je     1002fc <strchr+0x1b>
  1002ec:	40 38 f0             	cmp    %sil,%al
  1002ef:	74 18                	je     100309 <strchr+0x28>
        ++s;
  1002f1:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1002f5:	0f b6 07             	movzbl (%rdi),%eax
  1002f8:	84 c0                	test   %al,%al
  1002fa:	75 f0                	jne    1002ec <strchr+0xb>
        return nullptr;
  1002fc:	40 84 f6             	test   %sil,%sil
  1002ff:	b8 00 00 00 00       	mov    $0x0,%eax
  100304:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100308:	c3                   	ret    
  100309:	48 89 f8             	mov    %rdi,%rax
  10030c:	c3                   	ret    

000000000010030d <rand()>:
int rand() {
  10030d:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  100311:	83 3d 08 2d 00 00 00 	cmpl   $0x0,0x2d08(%rip)        # 103020 <rand_seed_set>
  100318:	74 27                	je     100341 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  10031a:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100321:	f4 51 58 
  100324:	48 0f af 05 ec 2c 00 	imul   0x2cec(%rip),%rax        # 103018 <rand_seed>
  10032b:	00 
  10032c:	48 83 c0 01          	add    $0x1,%rax
  100330:	48 89 05 e1 2c 00 00 	mov    %rax,0x2ce1(%rip)        # 103018 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  100337:	48 c1 e8 20          	shr    $0x20,%rax
  10033b:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100340:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  100341:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  100348:	87 d4 30 
  10034b:	48 89 05 c6 2c 00 00 	mov    %rax,0x2cc6(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100352:	c7 05 c4 2c 00 00 01 	movl   $0x1,0x2cc4(%rip)        # 103020 <rand_seed_set>
  100359:	00 00 00 
}
  10035c:	eb bc                	jmp    10031a <rand()+0xd>

000000000010035e <srand(unsigned int)>:
void srand(unsigned seed) {
  10035e:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  100362:	89 f8                	mov    %edi,%eax
  100364:	48 c1 e7 20          	shl    $0x20,%rdi
  100368:	48 09 c7             	or     %rax,%rdi
  10036b:	48 89 3d a6 2c 00 00 	mov    %rdi,0x2ca6(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100372:	c7 05 a4 2c 00 00 01 	movl   $0x1,0x2ca4(%rip)        # 103020 <rand_seed_set>
  100379:	00 00 00 
}
  10037c:	c3                   	ret    

000000000010037d <rand(int, int)>:
int rand(int min, int max) {
  10037d:	f3 0f 1e fa          	endbr64 
  100381:	55                   	push   %rbp
  100382:	48 89 e5             	mov    %rsp,%rbp
  100385:	41 54                	push   %r12
  100387:	53                   	push   %rbx
    assert(min <= max);
  100388:	39 f7                	cmp    %esi,%edi
  10038a:	7f 26                	jg     1003b2 <rand(int, int)+0x35>
  10038c:	41 89 fc             	mov    %edi,%r12d
  10038f:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  100391:	e8 77 ff ff ff       	call   10030d <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100396:	44 29 e3             	sub    %r12d,%ebx
  100399:	83 c3 01             	add    $0x1,%ebx
  10039c:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  10039f:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1003a1:	48 0f af d8          	imul   %rax,%rbx
  1003a5:	48 c1 eb 1f          	shr    $0x1f,%rbx
  1003a9:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  1003ad:	5b                   	pop    %rbx
  1003ae:	41 5c                	pop    %r12
  1003b0:	5d                   	pop    %rbp
  1003b1:	c3                   	ret    
    assert(min <= max);
  1003b2:	b9 00 00 00 00       	mov    $0x0,%ecx
  1003b7:	ba a2 0e 10 00       	mov    $0x100ea2,%edx
  1003bc:	be 45 01 00 00       	mov    $0x145,%esi
  1003c1:	bf ad 0e 10 00       	mov    $0x100ead,%edi
  1003c6:	e8 27 09 00 00       	call   100cf2 <assert_fail(char const*, int, char const*, char const*)>
  1003cb:	90                   	nop

00000000001003cc <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  1003cc:	f3 0f 1e fa          	endbr64 
  1003d0:	55                   	push   %rbp
  1003d1:	48 89 e5             	mov    %rsp,%rbp
  1003d4:	41 57                	push   %r15
  1003d6:	41 56                	push   %r14
  1003d8:	41 55                	push   %r13
  1003da:	41 54                	push   %r12
  1003dc:	53                   	push   %rbx
  1003dd:	48 83 ec 58          	sub    $0x58,%rsp
  1003e1:	49 89 fe             	mov    %rdi,%r14
  1003e4:	89 75 ac             	mov    %esi,-0x54(%rbp)
  1003e7:	49 89 d4             	mov    %rdx,%r12
  1003ea:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1003ee:	0f b6 02             	movzbl (%rdx),%eax
  1003f1:	84 c0                	test   %al,%al
  1003f3:	0f 85 cc 05 00 00    	jne    1009c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  1003f9:	48 83 c4 58          	add    $0x58,%rsp
  1003fd:	5b                   	pop    %rbx
  1003fe:	41 5c                	pop    %r12
  100400:	41 5d                	pop    %r13
  100402:	41 5e                	pop    %r14
  100404:	41 5f                	pop    %r15
  100406:	5d                   	pop    %rbp
  100407:	c3                   	ret    
        for (++format; *format; ++format) {
  100408:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  10040d:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  100413:	84 db                	test   %bl,%bl
  100415:	0f 84 f4 07 00 00    	je     100c0f <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  10041b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  100421:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  100427:	0f be f3             	movsbl %bl,%esi
  10042a:	bf c1 15 10 00       	mov    $0x1015c1,%edi
  10042f:	e8 ad fe ff ff       	call   1002e1 <strchr>
  100434:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100437:	48 85 c0             	test   %rax,%rax
  10043a:	74 70                	je     1004ac <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  10043c:	48 81 e9 c1 15 10 00 	sub    $0x1015c1,%rcx
  100443:	44 89 e0             	mov    %r12d,%eax
  100446:	d3 e0                	shl    %cl,%eax
  100448:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  10044b:	49 83 c7 01          	add    $0x1,%r15
  10044f:	41 0f b6 1f          	movzbl (%r15),%ebx
  100453:	84 db                	test   %bl,%bl
  100455:	75 d0                	jne    100427 <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  100457:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  10045b:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100461:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  100468:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  10046c:	0f 84 c8 00 00 00    	je     10053a <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  100472:	41 0f b6 07          	movzbl (%r15),%eax
  100476:	3c 6c                	cmp    $0x6c,%al
  100478:	0f 84 50 01 00 00    	je     1005ce <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  10047e:	0f 8f 3e 01 00 00    	jg     1005c2 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  100484:	3c 68                	cmp    $0x68,%al
  100486:	0f 85 62 01 00 00    	jne    1005ee <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  10048c:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  100490:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  100495:	8d 50 bd             	lea    -0x43(%rax),%edx
  100498:	80 fa 35             	cmp    $0x35,%dl
  10049b:	0f 87 de 05 00 00    	ja     100a7f <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  1004a1:	0f b6 d2             	movzbl %dl,%edx
  1004a4:	3e ff 24 d5 d0 0e 10 	notrack jmp *0x100ed0(,%rdx,8)
  1004ab:	00 
        if (*format >= '1' && *format <= '9') {
  1004ac:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1004b0:	8d 43 cf             	lea    -0x31(%rbx),%eax
  1004b3:	3c 08                	cmp    $0x8,%al
  1004b5:	77 34                	ja     1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004b7:	41 0f b6 07          	movzbl (%r15),%eax
  1004bb:	8d 50 d0             	lea    -0x30(%rax),%edx
  1004be:	80 fa 09             	cmp    $0x9,%dl
  1004c1:	77 61                	ja     100524 <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  1004c3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1004c9:	49 83 c7 01          	add    $0x1,%r15
  1004cd:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1004d2:	0f be c0             	movsbl %al,%eax
  1004d5:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004da:	41 0f b6 07          	movzbl (%r15),%eax
  1004de:	8d 50 d0             	lea    -0x30(%rax),%edx
  1004e1:	80 fa 09             	cmp    $0x9,%dl
  1004e4:	76 e3                	jbe    1004c9 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  1004e6:	e9 76 ff ff ff       	jmp    100461 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  1004eb:	80 fb 2a             	cmp    $0x2a,%bl
  1004ee:	75 3f                	jne    10052f <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  1004f0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004f4:	8b 07                	mov    (%rdi),%eax
  1004f6:	83 f8 2f             	cmp    $0x2f,%eax
  1004f9:	77 17                	ja     100512 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1004fb:	89 c2                	mov    %eax,%edx
  1004fd:	48 03 57 10          	add    0x10(%rdi),%rdx
  100501:	83 c0 08             	add    $0x8,%eax
  100504:	89 07                	mov    %eax,(%rdi)
  100506:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100509:	49 83 c7 01          	add    $0x1,%r15
  10050d:	e9 4f ff ff ff       	jmp    100461 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  100512:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100516:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10051a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10051e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100522:	eb e2                	jmp    100506 <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100524:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  10052a:	e9 32 ff ff ff       	jmp    100461 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  10052f:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  100535:	e9 27 ff ff ff       	jmp    100461 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  10053a:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  10053e:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  100543:	8d 48 d0             	lea    -0x30(%rax),%ecx
  100546:	80 f9 09             	cmp    $0x9,%cl
  100549:	76 13                	jbe    10055e <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  10054b:	3c 2a                	cmp    $0x2a,%al
  10054d:	74 33                	je     100582 <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  10054f:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  100552:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  100559:	e9 14 ff ff ff       	jmp    100472 <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10055e:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100563:	48 83 c2 01          	add    $0x1,%rdx
  100567:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  10056a:	0f be c0             	movsbl %al,%eax
  10056d:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100571:	0f b6 02             	movzbl (%rdx),%eax
  100574:	8d 70 d0             	lea    -0x30(%rax),%esi
  100577:	40 80 fe 09          	cmp    $0x9,%sil
  10057b:	76 e6                	jbe    100563 <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  10057d:	49 89 d7             	mov    %rdx,%r15
  100580:	eb 1c                	jmp    10059e <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  100582:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100586:	8b 01                	mov    (%rcx),%eax
  100588:	83 f8 2f             	cmp    $0x2f,%eax
  10058b:	77 23                	ja     1005b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  10058d:	89 c2                	mov    %eax,%edx
  10058f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100593:	83 c0 08             	add    $0x8,%eax
  100596:	89 01                	mov    %eax,(%rcx)
  100598:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  10059a:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  10059e:	85 c9                	test   %ecx,%ecx
  1005a0:	b8 00 00 00 00       	mov    $0x0,%eax
  1005a5:	0f 49 c1             	cmovns %ecx,%eax
  1005a8:	89 45 a8             	mov    %eax,-0x58(%rbp)
  1005ab:	e9 c2 fe ff ff       	jmp    100472 <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  1005b0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005b4:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1005b8:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005bc:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1005c0:	eb d6                	jmp    100598 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  1005c2:	3c 74                	cmp    $0x74,%al
  1005c4:	74 08                	je     1005ce <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1005c6:	3c 7a                	cmp    $0x7a,%al
  1005c8:	0f 85 77 06 00 00    	jne    100c45 <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  1005ce:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1005d2:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1005d7:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005da:	80 fa 35             	cmp    $0x35,%dl
  1005dd:	0f 87 9c 04 00 00    	ja     100a7f <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  1005e3:	0f b6 d2             	movzbl %dl,%edx
  1005e6:	3e ff 24 d5 80 10 10 	notrack jmp *0x101080(,%rdx,8)
  1005ed:	00 
  1005ee:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005f1:	80 fa 35             	cmp    $0x35,%dl
  1005f4:	0f 87 82 04 00 00    	ja     100a7c <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  1005fa:	0f b6 d2             	movzbl %dl,%edx
  1005fd:	3e ff 24 d5 30 12 10 	notrack jmp *0x101230(,%rdx,8)
  100604:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100605:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100609:	8b 07                	mov    (%rdi),%eax
  10060b:	83 f8 2f             	cmp    $0x2f,%eax
  10060e:	77 3a                	ja     10064a <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  100610:	89 c2                	mov    %eax,%edx
  100612:	48 03 57 10          	add    0x10(%rdi),%rdx
  100616:	83 c0 08             	add    $0x8,%eax
  100619:	89 07                	mov    %eax,(%rdi)
  10061b:	48 8b 12             	mov    (%rdx),%rdx
  10061e:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100621:	48 89 d0             	mov    %rdx,%rax
  100624:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100628:	49 89 d2             	mov    %rdx,%r10
  10062b:	49 f7 da             	neg    %r10
  10062e:	25 00 01 00 00       	and    $0x100,%eax
  100633:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100637:	0b 45 a0             	or     -0x60(%rbp),%eax
  10063a:	0c c0                	or     $0xc0,%al
  10063c:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  10063f:	41 bc bc 0e 10 00    	mov    $0x100ebc,%r12d
            break;
  100645:	e9 ec 01 00 00       	jmp    100836 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10064a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10064e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100652:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100656:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10065a:	eb bf                	jmp    10061b <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  10065c:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10065f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100663:	8b 01                	mov    (%rcx),%eax
  100665:	83 f8 2f             	cmp    $0x2f,%eax
  100668:	77 10                	ja     10067a <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  10066a:	89 c2                	mov    %eax,%edx
  10066c:	48 03 51 10          	add    0x10(%rcx),%rdx
  100670:	83 c0 08             	add    $0x8,%eax
  100673:	89 01                	mov    %eax,(%rcx)
  100675:	48 63 12             	movslq (%rdx),%rdx
  100678:	eb a7                	jmp    100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  10067a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10067e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100682:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100686:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10068a:	eb e9                	jmp    100675 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  10068c:	49 89 cf             	mov    %rcx,%r15
  10068f:	b8 01 00 00 00       	mov    $0x1,%eax
  100694:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  10069a:	e9 8f 00 00 00       	jmp    10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  10069f:	49 89 cf             	mov    %rcx,%r15
  1006a2:	b8 00 00 00 00       	mov    $0x0,%eax
  1006a7:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1006ad:	eb 7f                	jmp    10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  1006af:	b8 00 00 00 00       	mov    $0x0,%eax
  1006b4:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1006ba:	eb 72                	jmp    10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  1006bc:	b8 00 00 00 00       	mov    $0x0,%eax
  1006c1:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1006c7:	eb 65                	jmp    10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1006c9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1006d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1006d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1006d9:	eb 6d                	jmp    100748 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  1006db:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006df:	8b 07                	mov    (%rdi),%eax
  1006e1:	83 f8 2f             	cmp    $0x2f,%eax
  1006e4:	77 10                	ja     1006f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  1006e6:	89 c2                	mov    %eax,%edx
  1006e8:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006ec:	83 c0 08             	add    $0x8,%eax
  1006ef:	89 07                	mov    %eax,(%rdi)
  1006f1:	44 8b 12             	mov    (%rdx),%r10d
  1006f4:	eb 55                	jmp    10074b <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  1006f6:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1006fa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1006fe:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100702:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100706:	eb e9                	jmp    1006f1 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  100708:	49 89 cf             	mov    %rcx,%r15
  10070b:	b8 01 00 00 00       	mov    $0x1,%eax
  100710:	eb 16                	jmp    100728 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  100712:	49 89 cf             	mov    %rcx,%r15
  100715:	b8 00 00 00 00       	mov    $0x0,%eax
  10071a:	eb 0c                	jmp    100728 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  10071c:	b8 00 00 00 00       	mov    $0x0,%eax
  100721:	eb 05                	jmp    100728 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  100723:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100728:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10072e:	85 c0                	test   %eax,%eax
  100730:	74 a9                	je     1006db <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  100732:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100736:	8b 01                	mov    (%rcx),%eax
  100738:	83 f8 2f             	cmp    $0x2f,%eax
  10073b:	77 8c                	ja     1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  10073d:	89 c2                	mov    %eax,%edx
  10073f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100743:	83 c0 08             	add    $0x8,%eax
  100746:	89 01                	mov    %eax,(%rcx)
  100748:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  10074b:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  10074f:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  100752:	41 b9 b0 15 10 00    	mov    $0x1015b0,%r9d
    if (base < 0) {
  100758:	45 85 c0             	test   %r8d,%r8d
  10075b:	79 0c                	jns    100769 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  10075d:	45 89 c3             	mov    %r8d,%r11d
  100760:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  100763:	41 b9 90 15 10 00    	mov    $0x101590,%r9d
    *--pos = '\0';
  100769:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  10076d:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  100771:	0f 84 49 03 00 00    	je     100ac0 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100777:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  10077e:	41 83 f8 0a          	cmp    $0xa,%r8d
  100782:	0f 94 c0             	sete   %al
  100785:	0f b6 c0             	movzbl %al,%eax
  100788:	48 83 e8 04          	sub    $0x4,%rax
  10078c:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100791:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100795:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  100798:	49 63 f0             	movslq %r8d,%rsi
  10079b:	e9 5d 03 00 00       	jmp    100afd <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  1007a0:	49 89 cf             	mov    %rcx,%r15
  1007a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1007a8:	eb 16                	jmp    1007c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1007aa:	49 89 cf             	mov    %rcx,%r15
  1007ad:	b8 00 00 00 00       	mov    $0x0,%eax
  1007b2:	eb 0c                	jmp    1007c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1007b4:	b8 00 00 00 00       	mov    $0x0,%eax
  1007b9:	eb 05                	jmp    1007c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1007bb:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1007c0:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  1007c6:	e9 63 ff ff ff       	jmp    10072e <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  1007cb:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  1007ce:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007d2:	8b 01                	mov    (%rcx),%eax
  1007d4:	83 f8 2f             	cmp    $0x2f,%eax
  1007d7:	77 25                	ja     1007fe <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  1007d9:	89 c2                	mov    %eax,%edx
  1007db:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007df:	83 c0 08             	add    $0x8,%eax
  1007e2:	89 01                	mov    %eax,(%rcx)
  1007e4:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1007e7:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  1007ee:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  1007f4:	e9 64 ff ff ff       	jmp    10075d <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  1007f9:	49 89 cf             	mov    %rcx,%r15
  1007fc:	eb d0                	jmp    1007ce <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  1007fe:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100802:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100806:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10080a:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10080e:	eb d4                	jmp    1007e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  100810:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  100813:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100817:	8b 07                	mov    (%rdi),%eax
  100819:	83 f8 2f             	cmp    $0x2f,%eax
  10081c:	0f 87 c6 01 00 00    	ja     1009e8 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  100822:	89 c2                	mov    %eax,%edx
  100824:	48 03 57 10          	add    0x10(%rdi),%rdx
  100828:	83 c0 08             	add    $0x8,%eax
  10082b:	89 07                	mov    %eax,(%rdi)
  10082d:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  100830:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  100836:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100839:	83 e0 40             	and    $0x40,%eax
  10083c:	89 45 98             	mov    %eax,-0x68(%rbp)
  10083f:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  100845:	0f 85 d0 03 00 00    	jne    100c1b <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  10084b:	8b 45 a0             	mov    -0x60(%rbp),%eax
  10084e:	89 45 8c             	mov    %eax,-0x74(%rbp)
  100851:	25 c0 00 00 00       	and    $0xc0,%eax
  100856:	3d c0 00 00 00       	cmp    $0xc0,%eax
  10085b:	0f 84 c4 02 00 00    	je     100b25 <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100861:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100864:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  100867:	bb bc 0e 10 00       	mov    $0x100ebc,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  10086c:	83 f8 41             	cmp    $0x41,%eax
  10086f:	0f 84 e6 02 00 00    	je     100b5b <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100875:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  100878:	89 c8                	mov    %ecx,%eax
  10087a:	f7 d0                	not    %eax
  10087c:	c1 e8 1f             	shr    $0x1f,%eax
  10087f:	89 45 88             	mov    %eax,-0x78(%rbp)
  100882:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100886:	0f 85 0a 03 00 00    	jne    100b96 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  10088c:	84 c0                	test   %al,%al
  10088e:	0f 84 02 03 00 00    	je     100b96 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  100894:	48 63 f1             	movslq %ecx,%rsi
  100897:	4c 89 e7             	mov    %r12,%rdi
  10089a:	e8 1b fa ff ff       	call   1002ba <strnlen>
  10089f:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  1008a2:	8b 45 8c             	mov    -0x74(%rbp),%eax
  1008a5:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1008a8:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1008af:	83 f8 42             	cmp    $0x42,%eax
  1008b2:	0f 84 16 03 00 00    	je     100bce <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  1008b8:	48 89 df             	mov    %rbx,%rdi
  1008bb:	e8 db f9 ff ff       	call   10029b <strlen>
  1008c0:	8b 55 a8             	mov    -0x58(%rbp),%edx
  1008c3:	03 55 9c             	add    -0x64(%rbp),%edx
  1008c6:	44 89 e9             	mov    %r13d,%ecx
  1008c9:	29 d1                	sub    %edx,%ecx
  1008cb:	29 c1                	sub    %eax,%ecx
  1008cd:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  1008d0:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1008d3:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  1008d7:	75 39                	jne    100912 <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  1008d9:	85 c9                	test   %ecx,%ecx
  1008db:	7e 35                	jle    100912 <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  1008dd:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  1008e1:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  1008e4:	49 8b 06             	mov    (%r14),%rax
  1008e7:	89 da                	mov    %ebx,%edx
  1008e9:	be 20 00 00 00       	mov    $0x20,%esi
  1008ee:	4c 89 f7             	mov    %r14,%rdi
  1008f1:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1008f3:	41 83 ed 01          	sub    $0x1,%r13d
  1008f7:	45 85 ed             	test   %r13d,%r13d
  1008fa:	7f e8                	jg     1008e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  1008fc:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  100900:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100903:	85 ff                	test   %edi,%edi
  100905:	b8 01 00 00 00       	mov    $0x1,%eax
  10090a:	0f 4f c7             	cmovg  %edi,%eax
  10090d:	29 c7                	sub    %eax,%edi
  10090f:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  100912:	0f b6 03             	movzbl (%rbx),%eax
  100915:	84 c0                	test   %al,%al
  100917:	74 25                	je     10093e <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  100919:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  10091d:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  100921:	0f b6 f0             	movzbl %al,%esi
  100924:	49 8b 06             	mov    (%r14),%rax
  100927:	44 89 e2             	mov    %r12d,%edx
  10092a:	4c 89 f7             	mov    %r14,%rdi
  10092d:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  10092f:	48 83 c3 01          	add    $0x1,%rbx
  100933:	0f b6 03             	movzbl (%rbx),%eax
  100936:	84 c0                	test   %al,%al
  100938:	75 e7                	jne    100921 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  10093a:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  10093e:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  100941:	85 db                	test   %ebx,%ebx
  100943:	7e 21                	jle    100966 <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  100945:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  100949:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  10094d:	49 8b 06             	mov    (%r14),%rax
  100950:	44 89 e2             	mov    %r12d,%edx
  100953:	be 30 00 00 00       	mov    $0x30,%esi
  100958:	4c 89 f7             	mov    %r14,%rdi
  10095b:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  10095d:	83 eb 01             	sub    $0x1,%ebx
  100960:	75 eb                	jne    10094d <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  100962:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  100966:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100969:	85 c0                	test   %eax,%eax
  10096b:	7e 2a                	jle    100997 <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  10096d:	89 c3                	mov    %eax,%ebx
  10096f:	4c 01 e3             	add    %r12,%rbx
  100972:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  100976:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  10097a:	41 0f b6 34 24       	movzbl (%r12),%esi
  10097f:	49 8b 06             	mov    (%r14),%rax
  100982:	44 89 ea             	mov    %r13d,%edx
  100985:	4c 89 f7             	mov    %r14,%rdi
  100988:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  10098a:	49 83 c4 01          	add    $0x1,%r12
  10098e:	4c 39 e3             	cmp    %r12,%rbx
  100991:	75 e7                	jne    10097a <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  100993:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  100997:	45 85 ed             	test   %r13d,%r13d
  10099a:	7e 18                	jle    1009b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  10099c:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  10099f:	49 8b 06             	mov    (%r14),%rax
  1009a2:	89 da                	mov    %ebx,%edx
  1009a4:	be 20 00 00 00       	mov    $0x20,%esi
  1009a9:	4c 89 f7             	mov    %r14,%rdi
  1009ac:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1009ae:	41 83 ed 01          	sub    $0x1,%r13d
  1009b2:	75 eb                	jne    10099f <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  1009b4:	4d 8d 67 01          	lea    0x1(%r15),%r12
  1009b8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1009bd:	84 c0                	test   %al,%al
  1009bf:	0f 84 34 fa ff ff    	je     1003f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  1009c5:	3c 25                	cmp    $0x25,%al
  1009c7:	0f 84 3b fa ff ff    	je     100408 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  1009cd:	0f b6 f0             	movzbl %al,%esi
  1009d0:	49 8b 06             	mov    (%r14),%rax
  1009d3:	8b 55 ac             	mov    -0x54(%rbp),%edx
  1009d6:	4c 89 f7             	mov    %r14,%rdi
  1009d9:	ff 10                	call   *(%rax)
            continue;
  1009db:	4d 89 e7             	mov    %r12,%r15
  1009de:	eb d4                	jmp    1009b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  1009e0:	49 89 cf             	mov    %rcx,%r15
  1009e3:	e9 2b fe ff ff       	jmp    100813 <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  1009e8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1009ec:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1009f0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009f4:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1009f8:	e9 30 fe ff ff       	jmp    10082d <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  1009fd:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  100a00:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100a04:	8b 01                	mov    (%rcx),%eax
  100a06:	83 f8 2f             	cmp    $0x2f,%eax
  100a09:	77 17                	ja     100a22 <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  100a0b:	89 c2                	mov    %eax,%edx
  100a0d:	48 03 51 10          	add    0x10(%rcx),%rdx
  100a11:	83 c0 08             	add    $0x8,%eax
  100a14:	89 01                	mov    %eax,(%rcx)
  100a16:	8b 02                	mov    (%rdx),%eax
  100a18:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  100a1b:	eb 97                	jmp    1009b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  100a1d:	49 89 cf             	mov    %rcx,%r15
  100a20:	eb de                	jmp    100a00 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  100a22:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100a26:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100a2a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a2e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100a32:	eb e2                	jmp    100a16 <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  100a34:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  100a37:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100a3b:	8b 07                	mov    (%rdi),%eax
  100a3d:	83 f8 2f             	cmp    $0x2f,%eax
  100a40:	77 28                	ja     100a6a <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  100a42:	89 c2                	mov    %eax,%edx
  100a44:	48 03 57 10          	add    0x10(%rdi),%rdx
  100a48:	83 c0 08             	add    $0x8,%eax
  100a4b:	89 07                	mov    %eax,(%rdi)
  100a4d:	8b 02                	mov    (%rdx),%eax
  100a4f:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100a52:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100a56:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100a5a:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  100a60:	e9 d1 fd ff ff       	jmp    100836 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  100a65:	49 89 cf             	mov    %rcx,%r15
  100a68:	eb cd                	jmp    100a37 <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  100a6a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100a6e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100a72:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a76:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100a7a:	eb d1                	jmp    100a4d <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  100a7c:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  100a7f:	84 c0                	test   %al,%al
  100a81:	0f 85 6f 01 00 00    	jne    100bf6 <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  100a87:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100a8b:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100a8f:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  100a93:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100a97:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100a9d:	e9 94 fd ff ff       	jmp    100836 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  100aa2:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100aa8:	41 b9 b0 15 10 00    	mov    $0x1015b0,%r9d
    if (flags & FLAG_THOUSANDS) {
  100aae:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100ab4:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100abb:	e9 cc fc ff ff       	jmp    10078c <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  100ac0:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100ac7:	bf 00 00 00 00       	mov    $0x0,%edi
  100acc:	e9 c0 fc ff ff       	jmp    100791 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  100ad1:	49 89 cc             	mov    %rcx,%r12
  100ad4:	ba 00 00 00 00       	mov    $0x0,%edx
  100ad9:	48 f7 f6             	div    %rsi
  100adc:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  100ae1:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100ae3:	48 83 e9 01          	sub    $0x1,%rcx
  100ae7:	48 85 c0             	test   %rax,%rax
  100aea:	0f 84 5b fd ff ff    	je     10084b <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  100af0:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  100af4:	49 39 d4             	cmp    %rdx,%r12
  100af7:	0f 84 4e fd ff ff    	je     10084b <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  100afd:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100b01:	48 39 d7             	cmp    %rdx,%rdi
  100b04:	75 cb                	jne    100ad1 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  100b06:	49 89 cc             	mov    %rcx,%r12
  100b09:	41 83 f8 0a          	cmp    $0xa,%r8d
  100b0d:	0f 94 c2             	sete   %dl
  100b10:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100b14:	40 0f 94 c7          	sete   %dil
  100b18:	40 0f b6 ff          	movzbl %dil,%edi
  100b1c:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100b1e:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100b23:	eb be                	jmp    100ae3 <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  100b25:	bb b9 0e 10 00       	mov    $0x100eb9,%ebx
            if (flags & FLAG_NEGATIVE) {
  100b2a:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100b2d:	f6 c4 01             	test   $0x1,%ah
  100b30:	0f 85 3f fd ff ff    	jne    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  100b36:	bb b4 0e 10 00       	mov    $0x100eb4,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100b3b:	a8 10                	test   $0x10,%al
  100b3d:	0f 85 32 fd ff ff    	jne    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  100b43:	a8 08                	test   $0x8,%al
  100b45:	ba bc 0e 10 00       	mov    $0x100ebc,%edx
  100b4a:	b8 bb 0e 10 00       	mov    $0x100ebb,%eax
  100b4f:	48 0f 44 c2          	cmove  %rdx,%rax
  100b53:	48 89 c3             	mov    %rax,%rbx
  100b56:	e9 1a fd ff ff       	jmp    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  100b5b:	41 8d 43 10          	lea    0x10(%r11),%eax
  100b5f:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100b64:	0f 85 0b fd ff ff    	jne    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  100b6a:	4d 85 d2             	test   %r10,%r10
  100b6d:	75 0d                	jne    100b7c <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  100b6f:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  100b76:	0f 84 f9 fc ff ff    	je     100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  100b7c:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  100b80:	ba bd 0e 10 00       	mov    $0x100ebd,%edx
  100b85:	b8 b6 0e 10 00       	mov    $0x100eb6,%eax
  100b8a:	48 0f 44 c2          	cmove  %rdx,%rax
  100b8e:	48 89 c3             	mov    %rax,%rbx
  100b91:	e9 df fc ff ff       	jmp    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  100b96:	4c 89 e7             	mov    %r12,%rdi
  100b99:	e8 fd f6 ff ff       	call   10029b <strlen>
  100b9e:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100ba1:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100ba5:	0f 84 f7 fc ff ff    	je     1008a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  100bab:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  100baf:	0f 84 ed fc ff ff    	je     1008a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  100bb5:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  100bb8:	89 ca                	mov    %ecx,%edx
  100bba:	29 c2                	sub    %eax,%edx
  100bbc:	39 c1                	cmp    %eax,%ecx
  100bbe:	b8 00 00 00 00       	mov    $0x0,%eax
  100bc3:	0f 4f c2             	cmovg  %edx,%eax
  100bc6:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100bc9:	e9 ea fc ff ff       	jmp    1008b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  100bce:	48 89 df             	mov    %rbx,%rdi
  100bd1:	e8 c5 f6 ff ff       	call   10029b <strlen>
  100bd6:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100bd9:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100bdc:	44 89 e9             	mov    %r13d,%ecx
  100bdf:	29 f9                	sub    %edi,%ecx
  100be1:	29 c1                	sub    %eax,%ecx
  100be3:	44 39 ea             	cmp    %r13d,%edx
  100be6:	b8 00 00 00 00       	mov    $0x0,%eax
  100beb:	0f 4c c1             	cmovl  %ecx,%eax
  100bee:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100bf1:	e9 c2 fc ff ff       	jmp    1008b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  100bf6:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  100bf9:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100bfc:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100c00:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100c04:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100c0a:	e9 27 fc ff ff       	jmp    100836 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  100c0f:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  100c16:	e9 40 f8 ff ff       	jmp    10045b <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  100c1b:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100c1f:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  100c23:	0f 85 79 fe ff ff    	jne    100aa2 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  100c29:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100c2f:	41 b9 b0 15 10 00    	mov    $0x1015b0,%r9d
    if (flags & FLAG_THOUSANDS) {
  100c35:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  100c3b:	bf 00 00 00 00       	mov    $0x0,%edi
  100c40:	e9 4c fb ff ff       	jmp    100791 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  100c45:	8d 50 bd             	lea    -0x43(%rax),%edx
  100c48:	80 fa 35             	cmp    $0x35,%dl
  100c4b:	77 ac                	ja     100bf9 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  100c4d:	0f b6 d2             	movzbl %dl,%edx
  100c50:	3e ff 24 d5 e0 13 10 	notrack jmp *0x1013e0(,%rdx,8)
  100c57:	00 

0000000000100c58 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100c58:	f3 0f 1e fa          	endbr64 
  100c5c:	55                   	push   %rbp
  100c5d:	48 89 e5             	mov    %rsp,%rbp
  100c60:	53                   	push   %rbx
  100c61:	48 83 ec 28          	sub    $0x28,%rsp
  100c65:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100c68:	48 c7 45 d0 d8 15 10 	movq   $0x1015d8,-0x30(%rbp)
  100c6f:	00 
  100c70:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100c74:	48 01 f7             	add    %rsi,%rdi
  100c77:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100c7b:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100c82:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100c83:	be 00 00 00 00       	mov    $0x0,%esi
  100c88:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100c8c:	e8 3b f7 ff ff       	call   1003cc <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100c91:	48 85 db             	test   %rbx,%rbx
  100c94:	74 16                	je     100cac <vsnprintf+0x54>
  100c96:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100c9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100c9e:	48 39 c2             	cmp    %rax,%rdx
  100ca1:	73 05                	jae    100ca8 <vsnprintf+0x50>
        *sp.s_ = 0;
  100ca3:	c6 02 00             	movb   $0x0,(%rdx)
  100ca6:	eb 04                	jmp    100cac <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  100ca8:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  100cac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100cb0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100cb4:	c9                   	leave  
  100cb5:	c3                   	ret    

0000000000100cb6 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100cb6:	f3 0f 1e fa          	endbr64 
  100cba:	55                   	push   %rbp
  100cbb:	48 89 e5             	mov    %rsp,%rbp
  100cbe:	48 83 ec 50          	sub    $0x50,%rsp
  100cc2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100cc6:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100cca:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100cce:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100cd5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100cd9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100cdd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100ce1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100ce5:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100ce9:	e8 6a ff ff ff       	call   100c58 <vsnprintf>
    va_end(val);
    return n;
  100cee:	48 98                	cltq   
}
  100cf0:	c9                   	leave  
  100cf1:	c3                   	ret    

0000000000100cf2 <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100cf2:	f3 0f 1e fa          	endbr64 
  100cf6:	55                   	push   %rbp
  100cf7:	48 89 e5             	mov    %rsp,%rbp
  100cfa:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100d01:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100d04:	c7 05 ee 82 fb ff 30 	movl   $0x730,-0x47d12(%rip)        # b8ffc <cursorpos>
  100d0b:	07 00 00 
    char buf[240];
    if (description) {
  100d0e:	48 85 c9             	test   %rcx,%rcx
  100d11:	74 39                	je     100d4c <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100d13:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100d16:	48 83 ec 08          	sub    $0x8,%rsp
  100d1a:	52                   	push   %rdx
  100d1b:	56                   	push   %rsi
  100d1c:	57                   	push   %rdi
  100d1d:	48 89 f9             	mov    %rdi,%rcx
  100d20:	ba e0 15 10 00       	mov    $0x1015e0,%edx
  100d25:	be f0 00 00 00       	mov    $0xf0,%esi
  100d2a:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100d31:	b0 00                	mov    $0x0,%al
  100d33:	e8 7e ff ff ff       	call   100cb6 <snprintf>
  100d38:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100d3c:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100d41:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100d48:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100d4a:	eb fe                	jmp    100d4a <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100d4c:	49 89 d1             	mov    %rdx,%r9
  100d4f:	48 89 f9             	mov    %rdi,%rcx
  100d52:	ba 10 16 10 00       	mov    $0x101610,%edx
  100d57:	be f0 00 00 00       	mov    $0xf0,%esi
  100d5c:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100d63:	b0 00                	mov    $0x0,%al
  100d65:	e8 4c ff ff ff       	call   100cb6 <snprintf>
  100d6a:	eb d0                	jmp    100d3c <assert_fail(char const*, int, char const*, char const*)+0x4a>
