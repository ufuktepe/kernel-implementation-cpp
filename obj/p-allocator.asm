
obj/p-allocator.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 54                	push   %r12
  10000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100010:	0f 05                	syscall 
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  100012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  100015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  100017:	89 c7                	mov    %eax,%edi
  100019:	e8 a8 01 00 00       	call   1001c6 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  10001e:	ba 1b 30 10 00       	mov    $0x10301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  10002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 102008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100034:	48 83 e8 01          	sub    $0x1,%rax
  100038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 102000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  100045:	48 39 c2             	cmp    %rax,%rdx
  100048:	75 4f                	jne    100099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  10004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10004f:	0f 05                	syscall 
    return rax;
  100051:	eb f7                	jmp    10004a <process_main()+0x4a>
            }
            // check that the page starts out all zero
            for (unsigned long* l = (unsigned long*) heap_top;
                 l != (unsigned long*) (heap_top + PAGESIZE);
                 ++l) {
                assert(*l == 0);
  100053:	b9 00 00 00 00       	mov    $0x0,%ecx
  100058:	ba e0 0b 10 00       	mov    $0x100be0,%edx
  10005d:	be 24 00 00 00       	mov    $0x24,%esi
  100062:	bf e8 0b 10 00       	mov    $0x100be8,%edi
  100067:	e8 ee 0a 00 00       	call   100b5a <assert_fail(char const*, int, char const*, char const*)>
            }
            // check we can write to new page
            *heap_top = p;
  10006c:	44 88 21             	mov    %r12b,(%rcx)
            // check we can write to console
            console[CPOS(24, 79)] = p;
  10006f:	66 44 89 25 27 8f fb 	mov    %r12w,-0x470d9(%rip)        # b8f9e <console+0xf9e>
  100076:	ff 
            // update `heap_top`
            heap_top += PAGESIZE;
  100077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 102008 <heap_top>
  10007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  100082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100087:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  100089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 102000 <stack_bottom>
  100090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 102008 <heap_top>
  100097:	74 b1                	je     10004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  100099:	be 63 00 00 00       	mov    $0x63,%esi
  10009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1000a3:	e8 3d 01 00 00       	call   1001e5 <rand(int, int)>
  1000a8:	39 d8                	cmp    %ebx,%eax
  1000aa:	7d d6                	jge    100082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1000ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1000b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 102008 <heap_top>
  1000b8:	0f 05                	syscall 
            if (sys_page_alloc(heap_top) < 0) {
  1000ba:	85 c0                	test   %eax,%eax
  1000bc:	78 8c                	js     10004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1000be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 102008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1000c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1000cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1000cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1000d3:	0f 85 7a ff ff ff    	jne    100053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1000d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1000dd:	48 39 d0             	cmp    %rdx,%rax
  1000e0:	75 ed                	jne    1000cf <process_main()+0xcf>
  1000e2:	eb 88                	jmp    10006c <process_main()+0x6c>

00000000001000e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1000e4:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  1000e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1000ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1000f0:	73 0b                	jae    1000fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1000f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1000f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1000fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1000fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  100102:	c3                   	ret    

0000000000100103 <strlen>:
size_t strlen(const char* s) {
  100103:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  100107:	80 3f 00             	cmpb   $0x0,(%rdi)
  10010a:	74 10                	je     10011c <strlen+0x19>
  10010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100119:	75 f6                	jne    100111 <strlen+0xe>
  10011b:	c3                   	ret    
  10011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100121:	c3                   	ret    

0000000000100122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  100122:	f3 0f 1e fa          	endbr64 
  100126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100129:	ba 00 00 00 00       	mov    $0x0,%edx
  10012e:	48 85 f6             	test   %rsi,%rsi
  100131:	74 11                	je     100144 <strnlen+0x22>
  100133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  100137:	74 0c                	je     100145 <strnlen+0x23>
        ++n;
  100139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10013d:	48 39 d0             	cmp    %rdx,%rax
  100140:	75 f1                	jne    100133 <strnlen+0x11>
  100142:	eb 04                	jmp    100148 <strnlen+0x26>
  100144:	c3                   	ret    
  100145:	48 89 d0             	mov    %rdx,%rax
}
  100148:	c3                   	ret    

0000000000100149 <strchr>:
char* strchr(const char* s, int c) {
  100149:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  10014d:	0f b6 07             	movzbl (%rdi),%eax
  100150:	84 c0                	test   %al,%al
  100152:	74 10                	je     100164 <strchr+0x1b>
  100154:	40 38 f0             	cmp    %sil,%al
  100157:	74 18                	je     100171 <strchr+0x28>
        ++s;
  100159:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  10015d:	0f b6 07             	movzbl (%rdi),%eax
  100160:	84 c0                	test   %al,%al
  100162:	75 f0                	jne    100154 <strchr+0xb>
        return nullptr;
  100164:	40 84 f6             	test   %sil,%sil
  100167:	b8 00 00 00 00       	mov    $0x0,%eax
  10016c:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100170:	c3                   	ret    
  100171:	48 89 f8             	mov    %rdi,%rax
  100174:	c3                   	ret    

0000000000100175 <rand()>:
int rand() {
  100175:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  100179:	83 3d 98 1e 00 00 00 	cmpl   $0x0,0x1e98(%rip)        # 102018 <rand_seed_set>
  100180:	74 27                	je     1001a9 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  100182:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100189:	f4 51 58 
  10018c:	48 0f af 05 7c 1e 00 	imul   0x1e7c(%rip),%rax        # 102010 <rand_seed>
  100193:	00 
  100194:	48 83 c0 01          	add    $0x1,%rax
  100198:	48 89 05 71 1e 00 00 	mov    %rax,0x1e71(%rip)        # 102010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  10019f:	48 c1 e8 20          	shr    $0x20,%rax
  1001a3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1001a8:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001a9:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1001b0:	87 d4 30 
  1001b3:	48 89 05 56 1e 00 00 	mov    %rax,0x1e56(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001ba:	c7 05 54 1e 00 00 01 	movl   $0x1,0x1e54(%rip)        # 102018 <rand_seed_set>
  1001c1:	00 00 00 
}
  1001c4:	eb bc                	jmp    100182 <rand()+0xd>

00000000001001c6 <srand(unsigned int)>:
void srand(unsigned seed) {
  1001c6:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001ca:	89 f8                	mov    %edi,%eax
  1001cc:	48 c1 e7 20          	shl    $0x20,%rdi
  1001d0:	48 09 c7             	or     %rax,%rdi
  1001d3:	48 89 3d 36 1e 00 00 	mov    %rdi,0x1e36(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001da:	c7 05 34 1e 00 00 01 	movl   $0x1,0x1e34(%rip)        # 102018 <rand_seed_set>
  1001e1:	00 00 00 
}
  1001e4:	c3                   	ret    

00000000001001e5 <rand(int, int)>:
int rand(int min, int max) {
  1001e5:	f3 0f 1e fa          	endbr64 
  1001e9:	55                   	push   %rbp
  1001ea:	48 89 e5             	mov    %rsp,%rbp
  1001ed:	41 54                	push   %r12
  1001ef:	53                   	push   %rbx
    assert(min <= max);
  1001f0:	39 f7                	cmp    %esi,%edi
  1001f2:	7f 26                	jg     10021a <rand(int, int)+0x35>
  1001f4:	41 89 fc             	mov    %edi,%r12d
  1001f7:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1001f9:	e8 77 ff ff ff       	call   100175 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1001fe:	44 29 e3             	sub    %r12d,%ebx
  100201:	83 c3 01             	add    $0x1,%ebx
  100204:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  100207:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100209:	48 0f af d8          	imul   %rax,%rbx
  10020d:	48 c1 eb 1f          	shr    $0x1f,%rbx
  100211:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  100215:	5b                   	pop    %rbx
  100216:	41 5c                	pop    %r12
  100218:	5d                   	pop    %rbp
  100219:	c3                   	ret    
    assert(min <= max);
  10021a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10021f:	ba f7 0b 10 00       	mov    $0x100bf7,%edx
  100224:	be 45 01 00 00       	mov    $0x145,%esi
  100229:	bf 02 0c 10 00       	mov    $0x100c02,%edi
  10022e:	e8 27 09 00 00       	call   100b5a <assert_fail(char const*, int, char const*, char const*)>
  100233:	90                   	nop

0000000000100234 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  100234:	f3 0f 1e fa          	endbr64 
  100238:	55                   	push   %rbp
  100239:	48 89 e5             	mov    %rsp,%rbp
  10023c:	41 57                	push   %r15
  10023e:	41 56                	push   %r14
  100240:	41 55                	push   %r13
  100242:	41 54                	push   %r12
  100244:	53                   	push   %rbx
  100245:	48 83 ec 58          	sub    $0x58,%rsp
  100249:	49 89 fe             	mov    %rdi,%r14
  10024c:	89 75 ac             	mov    %esi,-0x54(%rbp)
  10024f:	49 89 d4             	mov    %rdx,%r12
  100252:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  100256:	0f b6 02             	movzbl (%rdx),%eax
  100259:	84 c0                	test   %al,%al
  10025b:	0f 85 cc 05 00 00    	jne    10082d <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  100261:	48 83 c4 58          	add    $0x58,%rsp
  100265:	5b                   	pop    %rbx
  100266:	41 5c                	pop    %r12
  100268:	41 5d                	pop    %r13
  10026a:	41 5e                	pop    %r14
  10026c:	41 5f                	pop    %r15
  10026e:	5d                   	pop    %rbp
  10026f:	c3                   	ret    
        for (++format; *format; ++format) {
  100270:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  100275:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  10027b:	84 db                	test   %bl,%bl
  10027d:	0f 84 f4 07 00 00    	je     100a77 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  100283:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  100289:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  10028f:	0f be f3             	movsbl %bl,%esi
  100292:	bf 11 13 10 00       	mov    $0x101311,%edi
  100297:	e8 ad fe ff ff       	call   100149 <strchr>
  10029c:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  10029f:	48 85 c0             	test   %rax,%rax
  1002a2:	74 70                	je     100314 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1002a4:	48 81 e9 11 13 10 00 	sub    $0x101311,%rcx
  1002ab:	44 89 e0             	mov    %r12d,%eax
  1002ae:	d3 e0                	shl    %cl,%eax
  1002b0:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1002b3:	49 83 c7 01          	add    $0x1,%r15
  1002b7:	41 0f b6 1f          	movzbl (%r15),%ebx
  1002bb:	84 db                	test   %bl,%bl
  1002bd:	75 d0                	jne    10028f <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  1002bf:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  1002c3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1002c9:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  1002d0:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  1002d4:	0f 84 c8 00 00 00    	je     1003a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  1002da:	41 0f b6 07          	movzbl (%r15),%eax
  1002de:	3c 6c                	cmp    $0x6c,%al
  1002e0:	0f 84 50 01 00 00    	je     100436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1002e6:	0f 8f 3e 01 00 00    	jg     10042a <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  1002ec:	3c 68                	cmp    $0x68,%al
  1002ee:	0f 85 62 01 00 00    	jne    100456 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  1002f4:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1002f8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1002fd:	8d 50 bd             	lea    -0x43(%rax),%edx
  100300:	80 fa 35             	cmp    $0x35,%dl
  100303:	0f 87 de 05 00 00    	ja     1008e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  100309:	0f b6 d2             	movzbl %dl,%edx
  10030c:	3e ff 24 d5 20 0c 10 	notrack jmp *0x100c20(,%rdx,8)
  100313:	00 
        if (*format >= '1' && *format <= '9') {
  100314:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  100318:	8d 43 cf             	lea    -0x31(%rbx),%eax
  10031b:	3c 08                	cmp    $0x8,%al
  10031d:	77 34                	ja     100353 <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10031f:	41 0f b6 07          	movzbl (%r15),%eax
  100323:	8d 50 d0             	lea    -0x30(%rax),%edx
  100326:	80 fa 09             	cmp    $0x9,%dl
  100329:	77 61                	ja     10038c <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  10032b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  100331:	49 83 c7 01          	add    $0x1,%r15
  100335:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  10033a:	0f be c0             	movsbl %al,%eax
  10033d:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100342:	41 0f b6 07          	movzbl (%r15),%eax
  100346:	8d 50 d0             	lea    -0x30(%rax),%edx
  100349:	80 fa 09             	cmp    $0x9,%dl
  10034c:	76 e3                	jbe    100331 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  10034e:	e9 76 ff ff ff       	jmp    1002c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  100353:	80 fb 2a             	cmp    $0x2a,%bl
  100356:	75 3f                	jne    100397 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  100358:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10035c:	8b 07                	mov    (%rdi),%eax
  10035e:	83 f8 2f             	cmp    $0x2f,%eax
  100361:	77 17                	ja     10037a <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  100363:	89 c2                	mov    %eax,%edx
  100365:	48 03 57 10          	add    0x10(%rdi),%rdx
  100369:	83 c0 08             	add    $0x8,%eax
  10036c:	89 07                	mov    %eax,(%rdi)
  10036e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100371:	49 83 c7 01          	add    $0x1,%r15
  100375:	e9 4f ff ff ff       	jmp    1002c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  10037a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10037e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100382:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100386:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10038a:	eb e2                	jmp    10036e <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10038c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100392:	e9 32 ff ff ff       	jmp    1002c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  100397:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  10039d:	e9 27 ff ff ff       	jmp    1002c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  1003a2:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  1003a6:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1003ab:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003ae:	80 f9 09             	cmp    $0x9,%cl
  1003b1:	76 13                	jbe    1003c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  1003b3:	3c 2a                	cmp    $0x2a,%al
  1003b5:	74 33                	je     1003ea <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  1003b7:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  1003ba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  1003c1:	e9 14 ff ff ff       	jmp    1002da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003c6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1003cb:	48 83 c2 01          	add    $0x1,%rdx
  1003cf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1003d2:	0f be c0             	movsbl %al,%eax
  1003d5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003d9:	0f b6 02             	movzbl (%rdx),%eax
  1003dc:	8d 70 d0             	lea    -0x30(%rax),%esi
  1003df:	40 80 fe 09          	cmp    $0x9,%sil
  1003e3:	76 e6                	jbe    1003cb <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  1003e5:	49 89 d7             	mov    %rdx,%r15
  1003e8:	eb 1c                	jmp    100406 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  1003ea:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1003ee:	8b 01                	mov    (%rcx),%eax
  1003f0:	83 f8 2f             	cmp    $0x2f,%eax
  1003f3:	77 23                	ja     100418 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  1003f5:	89 c2                	mov    %eax,%edx
  1003f7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1003fb:	83 c0 08             	add    $0x8,%eax
  1003fe:	89 01                	mov    %eax,(%rcx)
  100400:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100402:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  100406:	85 c9                	test   %ecx,%ecx
  100408:	b8 00 00 00 00       	mov    $0x0,%eax
  10040d:	0f 49 c1             	cmovns %ecx,%eax
  100410:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100413:	e9 c2 fe ff ff       	jmp    1002da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  100418:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10041c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100420:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100424:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100428:	eb d6                	jmp    100400 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  10042a:	3c 74                	cmp    $0x74,%al
  10042c:	74 08                	je     100436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  10042e:	3c 7a                	cmp    $0x7a,%al
  100430:	0f 85 77 06 00 00    	jne    100aad <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  100436:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  10043a:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  10043f:	8d 50 bd             	lea    -0x43(%rax),%edx
  100442:	80 fa 35             	cmp    $0x35,%dl
  100445:	0f 87 9c 04 00 00    	ja     1008e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  10044b:	0f b6 d2             	movzbl %dl,%edx
  10044e:	3e ff 24 d5 d0 0d 10 	notrack jmp *0x100dd0(,%rdx,8)
  100455:	00 
  100456:	8d 50 bd             	lea    -0x43(%rax),%edx
  100459:	80 fa 35             	cmp    $0x35,%dl
  10045c:	0f 87 82 04 00 00    	ja     1008e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  100462:	0f b6 d2             	movzbl %dl,%edx
  100465:	3e ff 24 d5 80 0f 10 	notrack jmp *0x100f80(,%rdx,8)
  10046c:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10046d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100471:	8b 07                	mov    (%rdi),%eax
  100473:	83 f8 2f             	cmp    $0x2f,%eax
  100476:	77 3a                	ja     1004b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  100478:	89 c2                	mov    %eax,%edx
  10047a:	48 03 57 10          	add    0x10(%rdi),%rdx
  10047e:	83 c0 08             	add    $0x8,%eax
  100481:	89 07                	mov    %eax,(%rdi)
  100483:	48 8b 12             	mov    (%rdx),%rdx
  100486:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100489:	48 89 d0             	mov    %rdx,%rax
  10048c:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100490:	49 89 d2             	mov    %rdx,%r10
  100493:	49 f7 da             	neg    %r10
  100496:	25 00 01 00 00       	and    $0x100,%eax
  10049b:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  10049f:	0b 45 a0             	or     -0x60(%rbp),%eax
  1004a2:	0c c0                	or     $0xc0,%al
  1004a4:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  1004a7:	41 bc 11 0c 10 00    	mov    $0x100c11,%r12d
            break;
  1004ad:	e9 ec 01 00 00       	jmp    10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004c2:	eb bf                	jmp    100483 <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  1004c4:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004c7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004cb:	8b 01                	mov    (%rcx),%eax
  1004cd:	83 f8 2f             	cmp    $0x2f,%eax
  1004d0:	77 10                	ja     1004e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  1004d2:	89 c2                	mov    %eax,%edx
  1004d4:	48 03 51 10          	add    0x10(%rcx),%rdx
  1004d8:	83 c0 08             	add    $0x8,%eax
  1004db:	89 01                	mov    %eax,(%rcx)
  1004dd:	48 63 12             	movslq (%rdx),%rdx
  1004e0:	eb a7                	jmp    100489 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  1004e2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004e6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004ee:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004f2:	eb e9                	jmp    1004dd <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  1004f4:	49 89 cf             	mov    %rcx,%r15
  1004f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1004fc:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  100502:	e9 8f 00 00 00       	jmp    100596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100507:	49 89 cf             	mov    %rcx,%r15
  10050a:	b8 00 00 00 00       	mov    $0x0,%eax
  10050f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  100515:	eb 7f                	jmp    100596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100517:	b8 00 00 00 00       	mov    $0x0,%eax
  10051c:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  100522:	eb 72                	jmp    100596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  100524:	b8 00 00 00 00       	mov    $0x0,%eax
  100529:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  10052f:	eb 65                	jmp    100596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100531:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100535:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100539:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10053d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100541:	eb 6d                	jmp    1005b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  100543:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100547:	8b 07                	mov    (%rdi),%eax
  100549:	83 f8 2f             	cmp    $0x2f,%eax
  10054c:	77 10                	ja     10055e <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  10054e:	89 c2                	mov    %eax,%edx
  100550:	48 03 57 10          	add    0x10(%rdi),%rdx
  100554:	83 c0 08             	add    $0x8,%eax
  100557:	89 07                	mov    %eax,(%rdi)
  100559:	44 8b 12             	mov    (%rdx),%r10d
  10055c:	eb 55                	jmp    1005b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  10055e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100562:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100566:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10056a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10056e:	eb e9                	jmp    100559 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  100570:	49 89 cf             	mov    %rcx,%r15
  100573:	b8 01 00 00 00       	mov    $0x1,%eax
  100578:	eb 16                	jmp    100590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  10057a:	49 89 cf             	mov    %rcx,%r15
  10057d:	b8 00 00 00 00       	mov    $0x0,%eax
  100582:	eb 0c                	jmp    100590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  100584:	b8 00 00 00 00       	mov    $0x0,%eax
  100589:	eb 05                	jmp    100590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  10058b:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100590:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100596:	85 c0                	test   %eax,%eax
  100598:	74 a9                	je     100543 <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  10059a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10059e:	8b 01                	mov    (%rcx),%eax
  1005a0:	83 f8 2f             	cmp    $0x2f,%eax
  1005a3:	77 8c                	ja     100531 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  1005a5:	89 c2                	mov    %eax,%edx
  1005a7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005ab:	83 c0 08             	add    $0x8,%eax
  1005ae:	89 01                	mov    %eax,(%rcx)
  1005b0:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  1005b3:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  1005b7:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  1005ba:	41 b9 00 13 10 00    	mov    $0x101300,%r9d
    if (base < 0) {
  1005c0:	45 85 c0             	test   %r8d,%r8d
  1005c3:	79 0c                	jns    1005d1 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  1005c5:	45 89 c3             	mov    %r8d,%r11d
  1005c8:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  1005cb:	41 b9 e0 12 10 00    	mov    $0x1012e0,%r9d
    *--pos = '\0';
  1005d1:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1005d5:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  1005d9:	0f 84 49 03 00 00    	je     100928 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1005df:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  1005e6:	41 83 f8 0a          	cmp    $0xa,%r8d
  1005ea:	0f 94 c0             	sete   %al
  1005ed:	0f b6 c0             	movzbl %al,%eax
  1005f0:	48 83 e8 04          	sub    $0x4,%rax
  1005f4:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1005f9:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1005fd:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  100600:	49 63 f0             	movslq %r8d,%rsi
  100603:	e9 5d 03 00 00       	jmp    100965 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  100608:	49 89 cf             	mov    %rcx,%r15
  10060b:	b8 01 00 00 00       	mov    $0x1,%eax
  100610:	eb 16                	jmp    100628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  100612:	49 89 cf             	mov    %rcx,%r15
  100615:	b8 00 00 00 00       	mov    $0x0,%eax
  10061a:	eb 0c                	jmp    100628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  10061c:	b8 00 00 00 00       	mov    $0x0,%eax
  100621:	eb 05                	jmp    100628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  100623:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100628:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  10062e:	e9 63 ff ff ff       	jmp    100596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  100633:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  100636:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10063a:	8b 01                	mov    (%rcx),%eax
  10063c:	83 f8 2f             	cmp    $0x2f,%eax
  10063f:	77 25                	ja     100666 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  100641:	89 c2                	mov    %eax,%edx
  100643:	48 03 51 10          	add    0x10(%rcx),%rdx
  100647:	83 c0 08             	add    $0x8,%eax
  10064a:	89 01                	mov    %eax,(%rcx)
  10064c:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  10064f:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  100656:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  10065c:	e9 64 ff ff ff       	jmp    1005c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  100661:	49 89 cf             	mov    %rcx,%r15
  100664:	eb d0                	jmp    100636 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  100666:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10066a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10066e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100672:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100676:	eb d4                	jmp    10064c <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  100678:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  10067b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10067f:	8b 07                	mov    (%rdi),%eax
  100681:	83 f8 2f             	cmp    $0x2f,%eax
  100684:	0f 87 c6 01 00 00    	ja     100850 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  10068a:	89 c2                	mov    %eax,%edx
  10068c:	48 03 57 10          	add    0x10(%rdi),%rdx
  100690:	83 c0 08             	add    $0x8,%eax
  100693:	89 07                	mov    %eax,(%rdi)
  100695:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  100698:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  10069e:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1006a1:	83 e0 40             	and    $0x40,%eax
  1006a4:	89 45 98             	mov    %eax,-0x68(%rbp)
  1006a7:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  1006ad:	0f 85 d0 03 00 00    	jne    100a83 <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1006b3:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1006b6:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1006b9:	25 c0 00 00 00       	and    $0xc0,%eax
  1006be:	3d c0 00 00 00       	cmp    $0xc0,%eax
  1006c3:	0f 84 c4 02 00 00    	je     10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1006c9:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1006cc:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  1006cf:	bb 11 0c 10 00       	mov    $0x100c11,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1006d4:	83 f8 41             	cmp    $0x41,%eax
  1006d7:	0f 84 e6 02 00 00    	je     1009c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1006dd:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  1006e0:	89 c8                	mov    %ecx,%eax
  1006e2:	f7 d0                	not    %eax
  1006e4:	c1 e8 1f             	shr    $0x1f,%eax
  1006e7:	89 45 88             	mov    %eax,-0x78(%rbp)
  1006ea:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1006ee:	0f 85 0a 03 00 00    	jne    1009fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  1006f4:	84 c0                	test   %al,%al
  1006f6:	0f 84 02 03 00 00    	je     1009fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  1006fc:	48 63 f1             	movslq %ecx,%rsi
  1006ff:	4c 89 e7             	mov    %r12,%rdi
  100702:	e8 1b fa ff ff       	call   100122 <strnlen>
  100707:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  10070a:	8b 45 8c             	mov    -0x74(%rbp),%eax
  10070d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  100710:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100717:	83 f8 42             	cmp    $0x42,%eax
  10071a:	0f 84 16 03 00 00    	je     100a36 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  100720:	48 89 df             	mov    %rbx,%rdi
  100723:	e8 db f9 ff ff       	call   100103 <strlen>
  100728:	8b 55 a8             	mov    -0x58(%rbp),%edx
  10072b:	03 55 9c             	add    -0x64(%rbp),%edx
  10072e:	44 89 e9             	mov    %r13d,%ecx
  100731:	29 d1                	sub    %edx,%ecx
  100733:	29 c1                	sub    %eax,%ecx
  100735:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  100738:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10073b:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  10073f:	75 39                	jne    10077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  100741:	85 c9                	test   %ecx,%ecx
  100743:	7e 35                	jle    10077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  100745:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  100749:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  10074c:	49 8b 06             	mov    (%r14),%rax
  10074f:	89 da                	mov    %ebx,%edx
  100751:	be 20 00 00 00       	mov    $0x20,%esi
  100756:	4c 89 f7             	mov    %r14,%rdi
  100759:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10075b:	41 83 ed 01          	sub    $0x1,%r13d
  10075f:	45 85 ed             	test   %r13d,%r13d
  100762:	7f e8                	jg     10074c <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  100764:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  100768:	8b 7d 98             	mov    -0x68(%rbp),%edi
  10076b:	85 ff                	test   %edi,%edi
  10076d:	b8 01 00 00 00       	mov    $0x1,%eax
  100772:	0f 4f c7             	cmovg  %edi,%eax
  100775:	29 c7                	sub    %eax,%edi
  100777:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  10077a:	0f b6 03             	movzbl (%rbx),%eax
  10077d:	84 c0                	test   %al,%al
  10077f:	74 25                	je     1007a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  100781:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  100785:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  100789:	0f b6 f0             	movzbl %al,%esi
  10078c:	49 8b 06             	mov    (%r14),%rax
  10078f:	44 89 e2             	mov    %r12d,%edx
  100792:	4c 89 f7             	mov    %r14,%rdi
  100795:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100797:	48 83 c3 01          	add    $0x1,%rbx
  10079b:	0f b6 03             	movzbl (%rbx),%eax
  10079e:	84 c0                	test   %al,%al
  1007a0:	75 e7                	jne    100789 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  1007a2:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  1007a6:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  1007a9:	85 db                	test   %ebx,%ebx
  1007ab:	7e 21                	jle    1007ce <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  1007ad:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1007b1:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  1007b5:	49 8b 06             	mov    (%r14),%rax
  1007b8:	44 89 e2             	mov    %r12d,%edx
  1007bb:	be 30 00 00 00       	mov    $0x30,%esi
  1007c0:	4c 89 f7             	mov    %r14,%rdi
  1007c3:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1007c5:	83 eb 01             	sub    $0x1,%ebx
  1007c8:	75 eb                	jne    1007b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  1007ca:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  1007ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1007d1:	85 c0                	test   %eax,%eax
  1007d3:	7e 2a                	jle    1007ff <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  1007d5:	89 c3                	mov    %eax,%ebx
  1007d7:	4c 01 e3             	add    %r12,%rbx
  1007da:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1007de:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  1007e2:	41 0f b6 34 24       	movzbl (%r12),%esi
  1007e7:	49 8b 06             	mov    (%r14),%rax
  1007ea:	44 89 ea             	mov    %r13d,%edx
  1007ed:	4c 89 f7             	mov    %r14,%rdi
  1007f0:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1007f2:	49 83 c4 01          	add    $0x1,%r12
  1007f6:	4c 39 e3             	cmp    %r12,%rbx
  1007f9:	75 e7                	jne    1007e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  1007fb:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  1007ff:	45 85 ed             	test   %r13d,%r13d
  100802:	7e 18                	jle    10081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  100804:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  100807:	49 8b 06             	mov    (%r14),%rax
  10080a:	89 da                	mov    %ebx,%edx
  10080c:	be 20 00 00 00       	mov    $0x20,%esi
  100811:	4c 89 f7             	mov    %r14,%rdi
  100814:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100816:	41 83 ed 01          	sub    $0x1,%r13d
  10081a:	75 eb                	jne    100807 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  10081c:	4d 8d 67 01          	lea    0x1(%r15),%r12
  100820:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  100825:	84 c0                	test   %al,%al
  100827:	0f 84 34 fa ff ff    	je     100261 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  10082d:	3c 25                	cmp    $0x25,%al
  10082f:	0f 84 3b fa ff ff    	je     100270 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  100835:	0f b6 f0             	movzbl %al,%esi
  100838:	49 8b 06             	mov    (%r14),%rax
  10083b:	8b 55 ac             	mov    -0x54(%rbp),%edx
  10083e:	4c 89 f7             	mov    %r14,%rdi
  100841:	ff 10                	call   *(%rax)
            continue;
  100843:	4d 89 e7             	mov    %r12,%r15
  100846:	eb d4                	jmp    10081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  100848:	49 89 cf             	mov    %rcx,%r15
  10084b:	e9 2b fe ff ff       	jmp    10067b <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  100850:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100854:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100858:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10085c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100860:	e9 30 fe ff ff       	jmp    100695 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  100865:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  100868:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10086c:	8b 01                	mov    (%rcx),%eax
  10086e:	83 f8 2f             	cmp    $0x2f,%eax
  100871:	77 17                	ja     10088a <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  100873:	89 c2                	mov    %eax,%edx
  100875:	48 03 51 10          	add    0x10(%rcx),%rdx
  100879:	83 c0 08             	add    $0x8,%eax
  10087c:	89 01                	mov    %eax,(%rcx)
  10087e:	8b 02                	mov    (%rdx),%eax
  100880:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  100883:	eb 97                	jmp    10081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  100885:	49 89 cf             	mov    %rcx,%r15
  100888:	eb de                	jmp    100868 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  10088a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10088e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100892:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100896:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10089a:	eb e2                	jmp    10087e <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  10089c:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  10089f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008a3:	8b 07                	mov    (%rdi),%eax
  1008a5:	83 f8 2f             	cmp    $0x2f,%eax
  1008a8:	77 28                	ja     1008d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  1008aa:	89 c2                	mov    %eax,%edx
  1008ac:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008b0:	83 c0 08             	add    $0x8,%eax
  1008b3:	89 07                	mov    %eax,(%rdi)
  1008b5:	8b 02                	mov    (%rdx),%eax
  1008b7:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1008ba:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1008be:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1008c2:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  1008c8:	e9 d1 fd ff ff       	jmp    10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  1008cd:	49 89 cf             	mov    %rcx,%r15
  1008d0:	eb cd                	jmp    10089f <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  1008d2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1008d6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1008da:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008de:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1008e2:	eb d1                	jmp    1008b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  1008e4:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  1008e7:	84 c0                	test   %al,%al
  1008e9:	0f 85 6f 01 00 00    	jne    100a5e <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  1008ef:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1008f3:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1008f7:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  1008fb:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1008ff:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100905:	e9 94 fd ff ff       	jmp    10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  10090a:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100910:	41 b9 00 13 10 00    	mov    $0x101300,%r9d
    if (flags & FLAG_THOUSANDS) {
  100916:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  10091c:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100923:	e9 cc fc ff ff       	jmp    1005f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  100928:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  10092f:	bf 00 00 00 00       	mov    $0x0,%edi
  100934:	e9 c0 fc ff ff       	jmp    1005f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  100939:	49 89 cc             	mov    %rcx,%r12
  10093c:	ba 00 00 00 00       	mov    $0x0,%edx
  100941:	48 f7 f6             	div    %rsi
  100944:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  100949:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  10094b:	48 83 e9 01          	sub    $0x1,%rcx
  10094f:	48 85 c0             	test   %rax,%rax
  100952:	0f 84 5b fd ff ff    	je     1006b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  100958:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  10095c:	49 39 d4             	cmp    %rdx,%r12
  10095f:	0f 84 4e fd ff ff    	je     1006b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  100965:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100969:	48 39 d7             	cmp    %rdx,%rdi
  10096c:	75 cb                	jne    100939 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  10096e:	49 89 cc             	mov    %rcx,%r12
  100971:	41 83 f8 0a          	cmp    $0xa,%r8d
  100975:	0f 94 c2             	sete   %dl
  100978:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  10097c:	40 0f 94 c7          	sete   %dil
  100980:	40 0f b6 ff          	movzbl %dil,%edi
  100984:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100986:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  10098b:	eb be                	jmp    10094b <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  10098d:	bb 0e 0c 10 00       	mov    $0x100c0e,%ebx
            if (flags & FLAG_NEGATIVE) {
  100992:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100995:	f6 c4 01             	test   $0x1,%ah
  100998:	0f 85 3f fd ff ff    	jne    1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  10099e:	bb 09 0c 10 00       	mov    $0x100c09,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1009a3:	a8 10                	test   $0x10,%al
  1009a5:	0f 85 32 fd ff ff    	jne    1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  1009ab:	a8 08                	test   $0x8,%al
  1009ad:	ba 11 0c 10 00       	mov    $0x100c11,%edx
  1009b2:	b8 10 0c 10 00       	mov    $0x100c10,%eax
  1009b7:	48 0f 44 c2          	cmove  %rdx,%rax
  1009bb:	48 89 c3             	mov    %rax,%rbx
  1009be:	e9 1a fd ff ff       	jmp    1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  1009c3:	41 8d 43 10          	lea    0x10(%r11),%eax
  1009c7:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1009cc:	0f 85 0b fd ff ff    	jne    1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  1009d2:	4d 85 d2             	test   %r10,%r10
  1009d5:	75 0d                	jne    1009e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  1009d7:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  1009de:	0f 84 f9 fc ff ff    	je     1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  1009e4:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  1009e8:	ba 12 0c 10 00       	mov    $0x100c12,%edx
  1009ed:	b8 0b 0c 10 00       	mov    $0x100c0b,%eax
  1009f2:	48 0f 44 c2          	cmove  %rdx,%rax
  1009f6:	48 89 c3             	mov    %rax,%rbx
  1009f9:	e9 df fc ff ff       	jmp    1006dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  1009fe:	4c 89 e7             	mov    %r12,%rdi
  100a01:	e8 fd f6 ff ff       	call   100103 <strlen>
  100a06:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100a09:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100a0d:	0f 84 f7 fc ff ff    	je     10070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  100a13:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  100a17:	0f 84 ed fc ff ff    	je     10070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  100a1d:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  100a20:	89 ca                	mov    %ecx,%edx
  100a22:	29 c2                	sub    %eax,%edx
  100a24:	39 c1                	cmp    %eax,%ecx
  100a26:	b8 00 00 00 00       	mov    $0x0,%eax
  100a2b:	0f 4f c2             	cmovg  %edx,%eax
  100a2e:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100a31:	e9 ea fc ff ff       	jmp    100720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  100a36:	48 89 df             	mov    %rbx,%rdi
  100a39:	e8 c5 f6 ff ff       	call   100103 <strlen>
  100a3e:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100a41:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100a44:	44 89 e9             	mov    %r13d,%ecx
  100a47:	29 f9                	sub    %edi,%ecx
  100a49:	29 c1                	sub    %eax,%ecx
  100a4b:	44 39 ea             	cmp    %r13d,%edx
  100a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  100a53:	0f 4c c1             	cmovl  %ecx,%eax
  100a56:	89 45 a8             	mov    %eax,-0x58(%rbp)
  100a59:	e9 c2 fc ff ff       	jmp    100720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  100a5e:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  100a61:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100a64:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100a68:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  100a6c:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  100a72:	e9 27 fc ff ff       	jmp    10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  100a77:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  100a7e:	e9 40 f8 ff ff       	jmp    1002c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  100a83:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100a87:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  100a8b:	0f 85 79 fe ff ff    	jne    10090a <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  100a91:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  100a97:	41 b9 00 13 10 00    	mov    $0x101300,%r9d
    if (flags & FLAG_THOUSANDS) {
  100a9d:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  100aa3:	bf 00 00 00 00       	mov    $0x0,%edi
  100aa8:	e9 4c fb ff ff       	jmp    1005f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  100aad:	8d 50 bd             	lea    -0x43(%rax),%edx
  100ab0:	80 fa 35             	cmp    $0x35,%dl
  100ab3:	77 ac                	ja     100a61 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  100ab5:	0f b6 d2             	movzbl %dl,%edx
  100ab8:	3e ff 24 d5 30 11 10 	notrack jmp *0x101130(,%rdx,8)
  100abf:	00 

0000000000100ac0 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100ac0:	f3 0f 1e fa          	endbr64 
  100ac4:	55                   	push   %rbp
  100ac5:	48 89 e5             	mov    %rsp,%rbp
  100ac8:	53                   	push   %rbx
  100ac9:	48 83 ec 28          	sub    $0x28,%rsp
  100acd:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100ad0:	48 c7 45 d0 28 13 10 	movq   $0x101328,-0x30(%rbp)
  100ad7:	00 
  100ad8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100adc:	48 01 f7             	add    %rsi,%rdi
  100adf:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100ae3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100aea:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100aeb:	be 00 00 00 00       	mov    $0x0,%esi
  100af0:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100af4:	e8 3b f7 ff ff       	call   100234 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100af9:	48 85 db             	test   %rbx,%rbx
  100afc:	74 16                	je     100b14 <vsnprintf+0x54>
  100afe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100b02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100b06:	48 39 c2             	cmp    %rax,%rdx
  100b09:	73 05                	jae    100b10 <vsnprintf+0x50>
        *sp.s_ = 0;
  100b0b:	c6 02 00             	movb   $0x0,(%rdx)
  100b0e:	eb 04                	jmp    100b14 <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  100b10:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  100b14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100b18:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100b1c:	c9                   	leave  
  100b1d:	c3                   	ret    

0000000000100b1e <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100b1e:	f3 0f 1e fa          	endbr64 
  100b22:	55                   	push   %rbp
  100b23:	48 89 e5             	mov    %rsp,%rbp
  100b26:	48 83 ec 50          	sub    $0x50,%rsp
  100b2a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100b2e:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100b32:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100b36:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100b3d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b41:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100b45:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100b49:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100b4d:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100b51:	e8 6a ff ff ff       	call   100ac0 <vsnprintf>
    va_end(val);
    return n;
  100b56:	48 98                	cltq   
}
  100b58:	c9                   	leave  
  100b59:	c3                   	ret    

0000000000100b5a <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100b5a:	f3 0f 1e fa          	endbr64 
  100b5e:	55                   	push   %rbp
  100b5f:	48 89 e5             	mov    %rsp,%rbp
  100b62:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100b69:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100b6c:	c7 05 86 84 fb ff 30 	movl   $0x730,-0x47b7a(%rip)        # b8ffc <cursorpos>
  100b73:	07 00 00 
    char buf[240];
    if (description) {
  100b76:	48 85 c9             	test   %rcx,%rcx
  100b79:	74 39                	je     100bb4 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100b7b:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100b7e:	48 83 ec 08          	sub    $0x8,%rsp
  100b82:	52                   	push   %rdx
  100b83:	56                   	push   %rsi
  100b84:	57                   	push   %rdi
  100b85:	48 89 f9             	mov    %rdi,%rcx
  100b88:	ba 30 13 10 00       	mov    $0x101330,%edx
  100b8d:	be f0 00 00 00       	mov    $0xf0,%esi
  100b92:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100b99:	b0 00                	mov    $0x0,%al
  100b9b:	e8 7e ff ff ff       	call   100b1e <snprintf>
  100ba0:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100ba4:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100ba9:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100bb0:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100bb2:	eb fe                	jmp    100bb2 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100bb4:	49 89 d1             	mov    %rdx,%r9
  100bb7:	48 89 f9             	mov    %rdi,%rcx
  100bba:	ba 60 13 10 00       	mov    $0x101360,%edx
  100bbf:	be f0 00 00 00       	mov    $0xf0,%esi
  100bc4:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100bcb:	b0 00                	mov    $0x0,%al
  100bcd:	e8 4c ff ff ff       	call   100b1e <snprintf>
  100bd2:	eb d0                	jmp    100ba4 <assert_fail(char const*, int, char const*, char const*)+0x4a>
