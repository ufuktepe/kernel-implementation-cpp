
obj/p-allocator4.full:     file format elf64-x86-64


Disassembly of section .text:

00000000001c0000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  1c0000:	f3 0f 1e fa          	endbr64 
  1c0004:	55                   	push   %rbp
  1c0005:	48 89 e5             	mov    %rsp,%rbp
  1c0008:	41 54                	push   %r12
  1c000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  1c000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1c0010:	0f 05                	syscall 
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  1c0012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1c0015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  1c0017:	89 c7                	mov    %eax,%edi
  1c0019:	e8 a8 01 00 00       	call   1c01c6 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1c001e:	ba 1b 30 1c 00       	mov    $0x1c301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1c0023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  1c002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 1c2008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1c0031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1c0034:	48 83 e8 01          	sub    $0x1,%rax
  1c0038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1c003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 1c2000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  1c0045:	48 39 c2             	cmp    %rax,%rdx
  1c0048:	75 4f                	jne    1c0099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  1c004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c004f:	0f 05                	syscall 
    return rax;
  1c0051:	eb f7                	jmp    1c004a <process_main()+0x4a>
            }
            // check that the page starts out all zero
            for (unsigned long* l = (unsigned long*) heap_top;
                 l != (unsigned long*) (heap_top + PAGESIZE);
                 ++l) {
                assert(*l == 0);
  1c0053:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c0058:	ba e0 0b 1c 00       	mov    $0x1c0be0,%edx
  1c005d:	be 24 00 00 00       	mov    $0x24,%esi
  1c0062:	bf e8 0b 1c 00       	mov    $0x1c0be8,%edi
  1c0067:	e8 ee 0a 00 00       	call   1c0b5a <assert_fail(char const*, int, char const*, char const*)>
            }
            // check we can write to new page
            *heap_top = p;
  1c006c:	44 88 21             	mov    %r12b,(%rcx)
            // check we can write to console
            console[CPOS(24, 79)] = p;
  1c006f:	66 44 89 25 27 8f ef 	mov    %r12w,-0x1070d9(%rip)        # b8f9e <console+0xf9e>
  1c0076:	ff 
            // update `heap_top`
            heap_top += PAGESIZE;
  1c0077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 1c2008 <heap_top>
  1c007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1c0082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c0087:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  1c0089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 1c2000 <stack_bottom>
  1c0090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 1c2008 <heap_top>
  1c0097:	74 b1                	je     1c004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1c0099:	be 63 00 00 00       	mov    $0x63,%esi
  1c009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1c00a3:	e8 3d 01 00 00       	call   1c01e5 <rand(int, int)>
  1c00a8:	39 d8                	cmp    %ebx,%eax
  1c00aa:	7d d6                	jge    1c0082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1c00ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1c00b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 1c2008 <heap_top>
  1c00b8:	0f 05                	syscall 
            if (sys_page_alloc(heap_top) < 0) {
  1c00ba:	85 c0                	test   %eax,%eax
  1c00bc:	78 8c                	js     1c004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 1c2008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c00c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1c00cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1c00d3:	0f 85 7a ff ff ff    	jne    1c0053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c00dd:	48 39 d0             	cmp    %rdx,%rax
  1c00e0:	75 ed                	jne    1c00cf <process_main()+0xcf>
  1c00e2:	eb 88                	jmp    1c006c <process_main()+0x6c>

00000000001c00e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1c00e4:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  1c00e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1c00ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1c00f0:	73 0b                	jae    1c00fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1c00f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1c00f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1c00fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1c00fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  1c0102:	c3                   	ret    

00000000001c0103 <strlen>:
size_t strlen(const char* s) {
  1c0103:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  1c0107:	80 3f 00             	cmpb   $0x0,(%rdi)
  1c010a:	74 10                	je     1c011c <strlen+0x19>
  1c010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1c0111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1c0115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1c0119:	75 f6                	jne    1c0111 <strlen+0xe>
  1c011b:	c3                   	ret    
  1c011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1c0121:	c3                   	ret    

00000000001c0122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1c0122:	f3 0f 1e fa          	endbr64 
  1c0126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c0129:	ba 00 00 00 00       	mov    $0x0,%edx
  1c012e:	48 85 f6             	test   %rsi,%rsi
  1c0131:	74 11                	je     1c0144 <strnlen+0x22>
  1c0133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1c0137:	74 0c                	je     1c0145 <strnlen+0x23>
        ++n;
  1c0139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c013d:	48 39 d0             	cmp    %rdx,%rax
  1c0140:	75 f1                	jne    1c0133 <strnlen+0x11>
  1c0142:	eb 04                	jmp    1c0148 <strnlen+0x26>
  1c0144:	c3                   	ret    
  1c0145:	48 89 d0             	mov    %rdx,%rax
}
  1c0148:	c3                   	ret    

00000000001c0149 <strchr>:
char* strchr(const char* s, int c) {
  1c0149:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  1c014d:	0f b6 07             	movzbl (%rdi),%eax
  1c0150:	84 c0                	test   %al,%al
  1c0152:	74 10                	je     1c0164 <strchr+0x1b>
  1c0154:	40 38 f0             	cmp    %sil,%al
  1c0157:	74 18                	je     1c0171 <strchr+0x28>
        ++s;
  1c0159:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1c015d:	0f b6 07             	movzbl (%rdi),%eax
  1c0160:	84 c0                	test   %al,%al
  1c0162:	75 f0                	jne    1c0154 <strchr+0xb>
        return nullptr;
  1c0164:	40 84 f6             	test   %sil,%sil
  1c0167:	b8 00 00 00 00       	mov    $0x0,%eax
  1c016c:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1c0170:	c3                   	ret    
  1c0171:	48 89 f8             	mov    %rdi,%rax
  1c0174:	c3                   	ret    

00000000001c0175 <rand()>:
int rand() {
  1c0175:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  1c0179:	83 3d 98 1e 00 00 00 	cmpl   $0x0,0x1e98(%rip)        # 1c2018 <rand_seed_set>
  1c0180:	74 27                	je     1c01a9 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1c0182:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1c0189:	f4 51 58 
  1c018c:	48 0f af 05 7c 1e 00 	imul   0x1e7c(%rip),%rax        # 1c2010 <rand_seed>
  1c0193:	00 
  1c0194:	48 83 c0 01          	add    $0x1,%rax
  1c0198:	48 89 05 71 1e 00 00 	mov    %rax,0x1e71(%rip)        # 1c2010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1c019f:	48 c1 e8 20          	shr    $0x20,%rax
  1c01a3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1c01a8:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01a9:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1c01b0:	87 d4 30 
  1c01b3:	48 89 05 56 1e 00 00 	mov    %rax,0x1e56(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01ba:	c7 05 54 1e 00 00 01 	movl   $0x1,0x1e54(%rip)        # 1c2018 <rand_seed_set>
  1c01c1:	00 00 00 
}
  1c01c4:	eb bc                	jmp    1c0182 <rand()+0xd>

00000000001c01c6 <srand(unsigned int)>:
void srand(unsigned seed) {
  1c01c6:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01ca:	89 f8                	mov    %edi,%eax
  1c01cc:	48 c1 e7 20          	shl    $0x20,%rdi
  1c01d0:	48 09 c7             	or     %rax,%rdi
  1c01d3:	48 89 3d 36 1e 00 00 	mov    %rdi,0x1e36(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01da:	c7 05 34 1e 00 00 01 	movl   $0x1,0x1e34(%rip)        # 1c2018 <rand_seed_set>
  1c01e1:	00 00 00 
}
  1c01e4:	c3                   	ret    

00000000001c01e5 <rand(int, int)>:
int rand(int min, int max) {
  1c01e5:	f3 0f 1e fa          	endbr64 
  1c01e9:	55                   	push   %rbp
  1c01ea:	48 89 e5             	mov    %rsp,%rbp
  1c01ed:	41 54                	push   %r12
  1c01ef:	53                   	push   %rbx
    assert(min <= max);
  1c01f0:	39 f7                	cmp    %esi,%edi
  1c01f2:	7f 26                	jg     1c021a <rand(int, int)+0x35>
  1c01f4:	41 89 fc             	mov    %edi,%r12d
  1c01f7:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1c01f9:	e8 77 ff ff ff       	call   1c0175 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c01fe:	44 29 e3             	sub    %r12d,%ebx
  1c0201:	83 c3 01             	add    $0x1,%ebx
  1c0204:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  1c0207:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c0209:	48 0f af d8          	imul   %rax,%rbx
  1c020d:	48 c1 eb 1f          	shr    $0x1f,%rbx
  1c0211:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  1c0215:	5b                   	pop    %rbx
  1c0216:	41 5c                	pop    %r12
  1c0218:	5d                   	pop    %rbp
  1c0219:	c3                   	ret    
    assert(min <= max);
  1c021a:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c021f:	ba f7 0b 1c 00       	mov    $0x1c0bf7,%edx
  1c0224:	be 45 01 00 00       	mov    $0x145,%esi
  1c0229:	bf 02 0c 1c 00       	mov    $0x1c0c02,%edi
  1c022e:	e8 27 09 00 00       	call   1c0b5a <assert_fail(char const*, int, char const*, char const*)>
  1c0233:	90                   	nop

00000000001c0234 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  1c0234:	f3 0f 1e fa          	endbr64 
  1c0238:	55                   	push   %rbp
  1c0239:	48 89 e5             	mov    %rsp,%rbp
  1c023c:	41 57                	push   %r15
  1c023e:	41 56                	push   %r14
  1c0240:	41 55                	push   %r13
  1c0242:	41 54                	push   %r12
  1c0244:	53                   	push   %rbx
  1c0245:	48 83 ec 58          	sub    $0x58,%rsp
  1c0249:	49 89 fe             	mov    %rdi,%r14
  1c024c:	89 75 ac             	mov    %esi,-0x54(%rbp)
  1c024f:	49 89 d4             	mov    %rdx,%r12
  1c0252:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1c0256:	0f b6 02             	movzbl (%rdx),%eax
  1c0259:	84 c0                	test   %al,%al
  1c025b:	0f 85 cc 05 00 00    	jne    1c082d <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  1c0261:	48 83 c4 58          	add    $0x58,%rsp
  1c0265:	5b                   	pop    %rbx
  1c0266:	41 5c                	pop    %r12
  1c0268:	41 5d                	pop    %r13
  1c026a:	41 5e                	pop    %r14
  1c026c:	41 5f                	pop    %r15
  1c026e:	5d                   	pop    %rbp
  1c026f:	c3                   	ret    
        for (++format; *format; ++format) {
  1c0270:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  1c0275:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  1c027b:	84 db                	test   %bl,%bl
  1c027d:	0f 84 f4 07 00 00    	je     1c0a77 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  1c0283:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  1c0289:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  1c028f:	0f be f3             	movsbl %bl,%esi
  1c0292:	bf 11 13 1c 00       	mov    $0x1c1311,%edi
  1c0297:	e8 ad fe ff ff       	call   1c0149 <strchr>
  1c029c:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1c029f:	48 85 c0             	test   %rax,%rax
  1c02a2:	74 70                	je     1c0314 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1c02a4:	48 81 e9 11 13 1c 00 	sub    $0x1c1311,%rcx
  1c02ab:	44 89 e0             	mov    %r12d,%eax
  1c02ae:	d3 e0                	shl    %cl,%eax
  1c02b0:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1c02b3:	49 83 c7 01          	add    $0x1,%r15
  1c02b7:	41 0f b6 1f          	movzbl (%r15),%ebx
  1c02bb:	84 db                	test   %bl,%bl
  1c02bd:	75 d0                	jne    1c028f <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  1c02bf:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  1c02c3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1c02c9:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  1c02d0:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  1c02d4:	0f 84 c8 00 00 00    	je     1c03a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  1c02da:	41 0f b6 07          	movzbl (%r15),%eax
  1c02de:	3c 6c                	cmp    $0x6c,%al
  1c02e0:	0f 84 50 01 00 00    	je     1c0436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1c02e6:	0f 8f 3e 01 00 00    	jg     1c042a <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  1c02ec:	3c 68                	cmp    $0x68,%al
  1c02ee:	0f 85 62 01 00 00    	jne    1c0456 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  1c02f4:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1c02f8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1c02fd:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0300:	80 fa 35             	cmp    $0x35,%dl
  1c0303:	0f 87 de 05 00 00    	ja     1c08e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  1c0309:	0f b6 d2             	movzbl %dl,%edx
  1c030c:	3e ff 24 d5 20 0c 1c 	notrack jmp *0x1c0c20(,%rdx,8)
  1c0313:	00 
        if (*format >= '1' && *format <= '9') {
  1c0314:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1c0318:	8d 43 cf             	lea    -0x31(%rbx),%eax
  1c031b:	3c 08                	cmp    $0x8,%al
  1c031d:	77 34                	ja     1c0353 <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c031f:	41 0f b6 07          	movzbl (%r15),%eax
  1c0323:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c0326:	80 fa 09             	cmp    $0x9,%dl
  1c0329:	77 61                	ja     1c038c <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  1c032b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1c0331:	49 83 c7 01          	add    $0x1,%r15
  1c0335:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1c033a:	0f be c0             	movsbl %al,%eax
  1c033d:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c0342:	41 0f b6 07          	movzbl (%r15),%eax
  1c0346:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c0349:	80 fa 09             	cmp    $0x9,%dl
  1c034c:	76 e3                	jbe    1c0331 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  1c034e:	e9 76 ff ff ff       	jmp    1c02c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  1c0353:	80 fb 2a             	cmp    $0x2a,%bl
  1c0356:	75 3f                	jne    1c0397 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  1c0358:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c035c:	8b 07                	mov    (%rdi),%eax
  1c035e:	83 f8 2f             	cmp    $0x2f,%eax
  1c0361:	77 17                	ja     1c037a <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1c0363:	89 c2                	mov    %eax,%edx
  1c0365:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0369:	83 c0 08             	add    $0x8,%eax
  1c036c:	89 07                	mov    %eax,(%rdi)
  1c036e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1c0371:	49 83 c7 01          	add    $0x1,%r15
  1c0375:	e9 4f ff ff ff       	jmp    1c02c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  1c037a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c037e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0382:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0386:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c038a:	eb e2                	jmp    1c036e <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c038c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1c0392:	e9 32 ff ff ff       	jmp    1c02c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  1c0397:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1c039d:	e9 27 ff ff ff       	jmp    1c02c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  1c03a2:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  1c03a6:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1c03ab:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c03ae:	80 f9 09             	cmp    $0x9,%cl
  1c03b1:	76 13                	jbe    1c03c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  1c03b3:	3c 2a                	cmp    $0x2a,%al
  1c03b5:	74 33                	je     1c03ea <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  1c03b7:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  1c03ba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  1c03c1:	e9 14 ff ff ff       	jmp    1c02da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03c6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1c03cb:	48 83 c2 01          	add    $0x1,%rdx
  1c03cf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1c03d2:	0f be c0             	movsbl %al,%eax
  1c03d5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03d9:	0f b6 02             	movzbl (%rdx),%eax
  1c03dc:	8d 70 d0             	lea    -0x30(%rax),%esi
  1c03df:	40 80 fe 09          	cmp    $0x9,%sil
  1c03e3:	76 e6                	jbe    1c03cb <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  1c03e5:	49 89 d7             	mov    %rdx,%r15
  1c03e8:	eb 1c                	jmp    1c0406 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  1c03ea:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c03ee:	8b 01                	mov    (%rcx),%eax
  1c03f0:	83 f8 2f             	cmp    $0x2f,%eax
  1c03f3:	77 23                	ja     1c0418 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  1c03f5:	89 c2                	mov    %eax,%edx
  1c03f7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c03fb:	83 c0 08             	add    $0x8,%eax
  1c03fe:	89 01                	mov    %eax,(%rcx)
  1c0400:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1c0402:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  1c0406:	85 c9                	test   %ecx,%ecx
  1c0408:	b8 00 00 00 00       	mov    $0x0,%eax
  1c040d:	0f 49 c1             	cmovns %ecx,%eax
  1c0410:	89 45 a8             	mov    %eax,-0x58(%rbp)
  1c0413:	e9 c2 fe ff ff       	jmp    1c02da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  1c0418:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c041c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0420:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0424:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0428:	eb d6                	jmp    1c0400 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  1c042a:	3c 74                	cmp    $0x74,%al
  1c042c:	74 08                	je     1c0436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1c042e:	3c 7a                	cmp    $0x7a,%al
  1c0430:	0f 85 77 06 00 00    	jne    1c0aad <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  1c0436:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1c043a:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1c043f:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0442:	80 fa 35             	cmp    $0x35,%dl
  1c0445:	0f 87 9c 04 00 00    	ja     1c08e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  1c044b:	0f b6 d2             	movzbl %dl,%edx
  1c044e:	3e ff 24 d5 d0 0d 1c 	notrack jmp *0x1c0dd0(,%rdx,8)
  1c0455:	00 
  1c0456:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0459:	80 fa 35             	cmp    $0x35,%dl
  1c045c:	0f 87 82 04 00 00    	ja     1c08e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  1c0462:	0f b6 d2             	movzbl %dl,%edx
  1c0465:	3e ff 24 d5 80 0f 1c 	notrack jmp *0x1c0f80(,%rdx,8)
  1c046c:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c046d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0471:	8b 07                	mov    (%rdi),%eax
  1c0473:	83 f8 2f             	cmp    $0x2f,%eax
  1c0476:	77 3a                	ja     1c04b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  1c0478:	89 c2                	mov    %eax,%edx
  1c047a:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c047e:	83 c0 08             	add    $0x8,%eax
  1c0481:	89 07                	mov    %eax,(%rdi)
  1c0483:	48 8b 12             	mov    (%rdx),%rdx
  1c0486:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1c0489:	48 89 d0             	mov    %rdx,%rax
  1c048c:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1c0490:	49 89 d2             	mov    %rdx,%r10
  1c0493:	49 f7 da             	neg    %r10
  1c0496:	25 00 01 00 00       	and    $0x100,%eax
  1c049b:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1c049f:	0b 45 a0             	or     -0x60(%rbp),%eax
  1c04a2:	0c c0                	or     $0xc0,%al
  1c04a4:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  1c04a7:	41 bc 11 0c 1c 00    	mov    $0x1c0c11,%r12d
            break;
  1c04ad:	e9 ec 01 00 00       	jmp    1c069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c04b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c04b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c04ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c04be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c04c2:	eb bf                	jmp    1c0483 <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  1c04c4:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c04c7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c04cb:	8b 01                	mov    (%rcx),%eax
  1c04cd:	83 f8 2f             	cmp    $0x2f,%eax
  1c04d0:	77 10                	ja     1c04e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  1c04d2:	89 c2                	mov    %eax,%edx
  1c04d4:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c04d8:	83 c0 08             	add    $0x8,%eax
  1c04db:	89 01                	mov    %eax,(%rcx)
  1c04dd:	48 63 12             	movslq (%rdx),%rdx
  1c04e0:	eb a7                	jmp    1c0489 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  1c04e2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c04e6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c04ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c04ee:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c04f2:	eb e9                	jmp    1c04dd <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  1c04f4:	49 89 cf             	mov    %rcx,%r15
  1c04f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1c04fc:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1c0502:	e9 8f 00 00 00       	jmp    1c0596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  1c0507:	49 89 cf             	mov    %rcx,%r15
  1c050a:	b8 00 00 00 00       	mov    $0x0,%eax
  1c050f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1c0515:	eb 7f                	jmp    1c0596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  1c0517:	b8 00 00 00 00       	mov    $0x0,%eax
  1c051c:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1c0522:	eb 72                	jmp    1c0596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  1c0524:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0529:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  1c052f:	eb 65                	jmp    1c0596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c0531:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0535:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0539:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c053d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0541:	eb 6d                	jmp    1c05b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  1c0543:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0547:	8b 07                	mov    (%rdi),%eax
  1c0549:	83 f8 2f             	cmp    $0x2f,%eax
  1c054c:	77 10                	ja     1c055e <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  1c054e:	89 c2                	mov    %eax,%edx
  1c0550:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0554:	83 c0 08             	add    $0x8,%eax
  1c0557:	89 07                	mov    %eax,(%rdi)
  1c0559:	44 8b 12             	mov    (%rdx),%r10d
  1c055c:	eb 55                	jmp    1c05b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  1c055e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0562:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0566:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c056a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c056e:	eb e9                	jmp    1c0559 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  1c0570:	49 89 cf             	mov    %rcx,%r15
  1c0573:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0578:	eb 16                	jmp    1c0590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1c057a:	49 89 cf             	mov    %rcx,%r15
  1c057d:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0582:	eb 0c                	jmp    1c0590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1c0584:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0589:	eb 05                	jmp    1c0590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  1c058b:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1c0590:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c0596:	85 c0                	test   %eax,%eax
  1c0598:	74 a9                	je     1c0543 <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  1c059a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c059e:	8b 01                	mov    (%rcx),%eax
  1c05a0:	83 f8 2f             	cmp    $0x2f,%eax
  1c05a3:	77 8c                	ja     1c0531 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  1c05a5:	89 c2                	mov    %eax,%edx
  1c05a7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c05ab:	83 c0 08             	add    $0x8,%eax
  1c05ae:	89 01                	mov    %eax,(%rcx)
  1c05b0:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  1c05b3:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  1c05b7:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  1c05ba:	41 b9 00 13 1c 00    	mov    $0x1c1300,%r9d
    if (base < 0) {
  1c05c0:	45 85 c0             	test   %r8d,%r8d
  1c05c3:	79 0c                	jns    1c05d1 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  1c05c5:	45 89 c3             	mov    %r8d,%r11d
  1c05c8:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  1c05cb:	41 b9 e0 12 1c 00    	mov    $0x1c12e0,%r9d
    *--pos = '\0';
  1c05d1:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c05d5:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  1c05d9:	0f 84 49 03 00 00    	je     1c0928 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c05df:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  1c05e6:	41 83 f8 0a          	cmp    $0xa,%r8d
  1c05ea:	0f 94 c0             	sete   %al
  1c05ed:	0f b6 c0             	movzbl %al,%eax
  1c05f0:	48 83 e8 04          	sub    $0x4,%rax
  1c05f4:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1c05f9:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1c05fd:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  1c0600:	49 63 f0             	movslq %r8d,%rsi
  1c0603:	e9 5d 03 00 00       	jmp    1c0965 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  1c0608:	49 89 cf             	mov    %rcx,%r15
  1c060b:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0610:	eb 16                	jmp    1c0628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1c0612:	49 89 cf             	mov    %rcx,%r15
  1c0615:	b8 00 00 00 00       	mov    $0x0,%eax
  1c061a:	eb 0c                	jmp    1c0628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1c061c:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0621:	eb 05                	jmp    1c0628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  1c0623:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1c0628:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  1c062e:	e9 63 ff ff ff       	jmp    1c0596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  1c0633:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  1c0636:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c063a:	8b 01                	mov    (%rcx),%eax
  1c063c:	83 f8 2f             	cmp    $0x2f,%eax
  1c063f:	77 25                	ja     1c0666 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  1c0641:	89 c2                	mov    %eax,%edx
  1c0643:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0647:	83 c0 08             	add    $0x8,%eax
  1c064a:	89 01                	mov    %eax,(%rcx)
  1c064c:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1c064f:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  1c0656:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  1c065c:	e9 64 ff ff ff       	jmp    1c05c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  1c0661:	49 89 cf             	mov    %rcx,%r15
  1c0664:	eb d0                	jmp    1c0636 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  1c0666:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c066a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c066e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0672:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0676:	eb d4                	jmp    1c064c <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  1c0678:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  1c067b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c067f:	8b 07                	mov    (%rdi),%eax
  1c0681:	83 f8 2f             	cmp    $0x2f,%eax
  1c0684:	0f 87 c6 01 00 00    	ja     1c0850 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  1c068a:	89 c2                	mov    %eax,%edx
  1c068c:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0690:	83 c0 08             	add    $0x8,%eax
  1c0693:	89 07                	mov    %eax,(%rdi)
  1c0695:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  1c0698:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  1c069e:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c06a1:	83 e0 40             	and    $0x40,%eax
  1c06a4:	89 45 98             	mov    %eax,-0x68(%rbp)
  1c06a7:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  1c06ad:	0f 85 d0 03 00 00    	jne    1c0a83 <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1c06b3:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c06b6:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1c06b9:	25 c0 00 00 00       	and    $0xc0,%eax
  1c06be:	3d c0 00 00 00       	cmp    $0xc0,%eax
  1c06c3:	0f 84 c4 02 00 00    	je     1c098d <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c06c9:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c06cc:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  1c06cf:	bb 11 0c 1c 00       	mov    $0x1c0c11,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c06d4:	83 f8 41             	cmp    $0x41,%eax
  1c06d7:	0f 84 e6 02 00 00    	je     1c09c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1c06dd:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  1c06e0:	89 c8                	mov    %ecx,%eax
  1c06e2:	f7 d0                	not    %eax
  1c06e4:	c1 e8 1f             	shr    $0x1f,%eax
  1c06e7:	89 45 88             	mov    %eax,-0x78(%rbp)
  1c06ea:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1c06ee:	0f 85 0a 03 00 00    	jne    1c09fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  1c06f4:	84 c0                	test   %al,%al
  1c06f6:	0f 84 02 03 00 00    	je     1c09fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  1c06fc:	48 63 f1             	movslq %ecx,%rsi
  1c06ff:	4c 89 e7             	mov    %r12,%rdi
  1c0702:	e8 1b fa ff ff       	call   1c0122 <strnlen>
  1c0707:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  1c070a:	8b 45 8c             	mov    -0x74(%rbp),%eax
  1c070d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1c0710:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c0717:	83 f8 42             	cmp    $0x42,%eax
  1c071a:	0f 84 16 03 00 00    	je     1c0a36 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  1c0720:	48 89 df             	mov    %rbx,%rdi
  1c0723:	e8 db f9 ff ff       	call   1c0103 <strlen>
  1c0728:	8b 55 a8             	mov    -0x58(%rbp),%edx
  1c072b:	03 55 9c             	add    -0x64(%rbp),%edx
  1c072e:	44 89 e9             	mov    %r13d,%ecx
  1c0731:	29 d1                	sub    %edx,%ecx
  1c0733:	29 c1                	sub    %eax,%ecx
  1c0735:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  1c0738:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c073b:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  1c073f:	75 39                	jne    1c077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  1c0741:	85 c9                	test   %ecx,%ecx
  1c0743:	7e 35                	jle    1c077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  1c0745:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  1c0749:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  1c074c:	49 8b 06             	mov    (%r14),%rax
  1c074f:	89 da                	mov    %ebx,%edx
  1c0751:	be 20 00 00 00       	mov    $0x20,%esi
  1c0756:	4c 89 f7             	mov    %r14,%rdi
  1c0759:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c075b:	41 83 ed 01          	sub    $0x1,%r13d
  1c075f:	45 85 ed             	test   %r13d,%r13d
  1c0762:	7f e8                	jg     1c074c <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  1c0764:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  1c0768:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1c076b:	85 ff                	test   %edi,%edi
  1c076d:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0772:	0f 4f c7             	cmovg  %edi,%eax
  1c0775:	29 c7                	sub    %eax,%edi
  1c0777:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  1c077a:	0f b6 03             	movzbl (%rbx),%eax
  1c077d:	84 c0                	test   %al,%al
  1c077f:	74 25                	je     1c07a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  1c0781:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1c0785:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  1c0789:	0f b6 f0             	movzbl %al,%esi
  1c078c:	49 8b 06             	mov    (%r14),%rax
  1c078f:	44 89 e2             	mov    %r12d,%edx
  1c0792:	4c 89 f7             	mov    %r14,%rdi
  1c0795:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1c0797:	48 83 c3 01          	add    $0x1,%rbx
  1c079b:	0f b6 03             	movzbl (%rbx),%eax
  1c079e:	84 c0                	test   %al,%al
  1c07a0:	75 e7                	jne    1c0789 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  1c07a2:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  1c07a6:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  1c07a9:	85 db                	test   %ebx,%ebx
  1c07ab:	7e 21                	jle    1c07ce <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  1c07ad:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1c07b1:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  1c07b5:	49 8b 06             	mov    (%r14),%rax
  1c07b8:	44 89 e2             	mov    %r12d,%edx
  1c07bb:	be 30 00 00 00       	mov    $0x30,%esi
  1c07c0:	4c 89 f7             	mov    %r14,%rdi
  1c07c3:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1c07c5:	83 eb 01             	sub    $0x1,%ebx
  1c07c8:	75 eb                	jne    1c07b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  1c07ca:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  1c07ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1c07d1:	85 c0                	test   %eax,%eax
  1c07d3:	7e 2a                	jle    1c07ff <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  1c07d5:	89 c3                	mov    %eax,%ebx
  1c07d7:	4c 01 e3             	add    %r12,%rbx
  1c07da:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1c07de:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  1c07e2:	41 0f b6 34 24       	movzbl (%r12),%esi
  1c07e7:	49 8b 06             	mov    (%r14),%rax
  1c07ea:	44 89 ea             	mov    %r13d,%edx
  1c07ed:	4c 89 f7             	mov    %r14,%rdi
  1c07f0:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1c07f2:	49 83 c4 01          	add    $0x1,%r12
  1c07f6:	4c 39 e3             	cmp    %r12,%rbx
  1c07f9:	75 e7                	jne    1c07e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  1c07fb:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  1c07ff:	45 85 ed             	test   %r13d,%r13d
  1c0802:	7e 18                	jle    1c081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  1c0804:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  1c0807:	49 8b 06             	mov    (%r14),%rax
  1c080a:	89 da                	mov    %ebx,%edx
  1c080c:	be 20 00 00 00       	mov    $0x20,%esi
  1c0811:	4c 89 f7             	mov    %r14,%rdi
  1c0814:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1c0816:	41 83 ed 01          	sub    $0x1,%r13d
  1c081a:	75 eb                	jne    1c0807 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  1c081c:	4d 8d 67 01          	lea    0x1(%r15),%r12
  1c0820:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1c0825:	84 c0                	test   %al,%al
  1c0827:	0f 84 34 fa ff ff    	je     1c0261 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  1c082d:	3c 25                	cmp    $0x25,%al
  1c082f:	0f 84 3b fa ff ff    	je     1c0270 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  1c0835:	0f b6 f0             	movzbl %al,%esi
  1c0838:	49 8b 06             	mov    (%r14),%rax
  1c083b:	8b 55 ac             	mov    -0x54(%rbp),%edx
  1c083e:	4c 89 f7             	mov    %r14,%rdi
  1c0841:	ff 10                	call   *(%rax)
            continue;
  1c0843:	4d 89 e7             	mov    %r12,%r15
  1c0846:	eb d4                	jmp    1c081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  1c0848:	49 89 cf             	mov    %rcx,%r15
  1c084b:	e9 2b fe ff ff       	jmp    1c067b <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  1c0850:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0854:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0858:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c085c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0860:	e9 30 fe ff ff       	jmp    1c0695 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  1c0865:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  1c0868:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c086c:	8b 01                	mov    (%rcx),%eax
  1c086e:	83 f8 2f             	cmp    $0x2f,%eax
  1c0871:	77 17                	ja     1c088a <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  1c0873:	89 c2                	mov    %eax,%edx
  1c0875:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0879:	83 c0 08             	add    $0x8,%eax
  1c087c:	89 01                	mov    %eax,(%rcx)
  1c087e:	8b 02                	mov    (%rdx),%eax
  1c0880:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  1c0883:	eb 97                	jmp    1c081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  1c0885:	49 89 cf             	mov    %rcx,%r15
  1c0888:	eb de                	jmp    1c0868 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  1c088a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c088e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0892:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0896:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c089a:	eb e2                	jmp    1c087e <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  1c089c:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  1c089f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c08a3:	8b 07                	mov    (%rdi),%eax
  1c08a5:	83 f8 2f             	cmp    $0x2f,%eax
  1c08a8:	77 28                	ja     1c08d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  1c08aa:	89 c2                	mov    %eax,%edx
  1c08ac:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c08b0:	83 c0 08             	add    $0x8,%eax
  1c08b3:	89 07                	mov    %eax,(%rdi)
  1c08b5:	8b 02                	mov    (%rdx),%eax
  1c08b7:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c08ba:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1c08be:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1c08c2:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  1c08c8:	e9 d1 fd ff ff       	jmp    1c069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  1c08cd:	49 89 cf             	mov    %rcx,%r15
  1c08d0:	eb cd                	jmp    1c089f <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  1c08d2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c08d6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c08da:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c08de:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c08e2:	eb d1                	jmp    1c08b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  1c08e4:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  1c08e7:	84 c0                	test   %al,%al
  1c08e9:	0f 85 6f 01 00 00    	jne    1c0a5e <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  1c08ef:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1c08f3:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1c08f7:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  1c08fb:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1c08ff:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  1c0905:	e9 94 fd ff ff       	jmp    1c069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  1c090a:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  1c0910:	41 b9 00 13 1c 00    	mov    $0x1c1300,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c0916:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c091c:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1c0923:	e9 cc fc ff ff       	jmp    1c05f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  1c0928:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  1c092f:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0934:	e9 c0 fc ff ff       	jmp    1c05f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  1c0939:	49 89 cc             	mov    %rcx,%r12
  1c093c:	ba 00 00 00 00       	mov    $0x0,%edx
  1c0941:	48 f7 f6             	div    %rsi
  1c0944:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  1c0949:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  1c094b:	48 83 e9 01          	sub    $0x1,%rcx
  1c094f:	48 85 c0             	test   %rax,%rax
  1c0952:	0f 84 5b fd ff ff    	je     1c06b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  1c0958:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  1c095c:	49 39 d4             	cmp    %rdx,%r12
  1c095f:	0f 84 4e fd ff ff    	je     1c06b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  1c0965:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  1c0969:	48 39 d7             	cmp    %rdx,%rdi
  1c096c:	75 cb                	jne    1c0939 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  1c096e:	49 89 cc             	mov    %rcx,%r12
  1c0971:	41 83 f8 0a          	cmp    $0xa,%r8d
  1c0975:	0f 94 c2             	sete   %dl
  1c0978:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1c097c:	40 0f 94 c7          	sete   %dil
  1c0980:	40 0f b6 ff          	movzbl %dil,%edi
  1c0984:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1c0986:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1c098b:	eb be                	jmp    1c094b <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  1c098d:	bb 0e 0c 1c 00       	mov    $0x1c0c0e,%ebx
            if (flags & FLAG_NEGATIVE) {
  1c0992:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c0995:	f6 c4 01             	test   $0x1,%ah
  1c0998:	0f 85 3f fd ff ff    	jne    1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  1c099e:	bb 09 0c 1c 00       	mov    $0x1c0c09,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1c09a3:	a8 10                	test   $0x10,%al
  1c09a5:	0f 85 32 fd ff ff    	jne    1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  1c09ab:	a8 08                	test   $0x8,%al
  1c09ad:	ba 11 0c 1c 00       	mov    $0x1c0c11,%edx
  1c09b2:	b8 10 0c 1c 00       	mov    $0x1c0c10,%eax
  1c09b7:	48 0f 44 c2          	cmove  %rdx,%rax
  1c09bb:	48 89 c3             	mov    %rax,%rbx
  1c09be:	e9 1a fd ff ff       	jmp    1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  1c09c3:	41 8d 43 10          	lea    0x10(%r11),%eax
  1c09c7:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1c09cc:	0f 85 0b fd ff ff    	jne    1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  1c09d2:	4d 85 d2             	test   %r10,%r10
  1c09d5:	75 0d                	jne    1c09e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  1c09d7:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  1c09de:	0f 84 f9 fc ff ff    	je     1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  1c09e4:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  1c09e8:	ba 12 0c 1c 00       	mov    $0x1c0c12,%edx
  1c09ed:	b8 0b 0c 1c 00       	mov    $0x1c0c0b,%eax
  1c09f2:	48 0f 44 c2          	cmove  %rdx,%rax
  1c09f6:	48 89 c3             	mov    %rax,%rbx
  1c09f9:	e9 df fc ff ff       	jmp    1c06dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  1c09fe:	4c 89 e7             	mov    %r12,%rdi
  1c0a01:	e8 fd f6 ff ff       	call   1c0103 <strlen>
  1c0a06:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  1c0a09:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1c0a0d:	0f 84 f7 fc ff ff    	je     1c070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  1c0a13:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  1c0a17:	0f 84 ed fc ff ff    	je     1c070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  1c0a1d:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  1c0a20:	89 ca                	mov    %ecx,%edx
  1c0a22:	29 c2                	sub    %eax,%edx
  1c0a24:	39 c1                	cmp    %eax,%ecx
  1c0a26:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0a2b:	0f 4f c2             	cmovg  %edx,%eax
  1c0a2e:	89 45 a8             	mov    %eax,-0x58(%rbp)
  1c0a31:	e9 ea fc ff ff       	jmp    1c0720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  1c0a36:	48 89 df             	mov    %rbx,%rdi
  1c0a39:	e8 c5 f6 ff ff       	call   1c0103 <strlen>
  1c0a3e:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  1c0a41:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1c0a44:	44 89 e9             	mov    %r13d,%ecx
  1c0a47:	29 f9                	sub    %edi,%ecx
  1c0a49:	29 c1                	sub    %eax,%ecx
  1c0a4b:	44 39 ea             	cmp    %r13d,%edx
  1c0a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0a53:	0f 4c c1             	cmovl  %ecx,%eax
  1c0a56:	89 45 a8             	mov    %eax,-0x58(%rbp)
  1c0a59:	e9 c2 fc ff ff       	jmp    1c0720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  1c0a5e:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  1c0a61:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c0a64:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1c0a68:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1c0a6c:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  1c0a72:	e9 27 fc ff ff       	jmp    1c069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  1c0a77:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  1c0a7e:	e9 40 f8 ff ff       	jmp    1c02c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  1c0a83:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c0a87:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  1c0a8b:	0f 85 79 fe ff ff    	jne    1c090a <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  1c0a91:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  1c0a97:	41 b9 00 13 1c 00    	mov    $0x1c1300,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c0a9d:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  1c0aa3:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0aa8:	e9 4c fb ff ff       	jmp    1c05f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  1c0aad:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0ab0:	80 fa 35             	cmp    $0x35,%dl
  1c0ab3:	77 ac                	ja     1c0a61 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  1c0ab5:	0f b6 d2             	movzbl %dl,%edx
  1c0ab8:	3e ff 24 d5 30 11 1c 	notrack jmp *0x1c1130(,%rdx,8)
  1c0abf:	00 

00000000001c0ac0 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1c0ac0:	f3 0f 1e fa          	endbr64 
  1c0ac4:	55                   	push   %rbp
  1c0ac5:	48 89 e5             	mov    %rsp,%rbp
  1c0ac8:	53                   	push   %rbx
  1c0ac9:	48 83 ec 28          	sub    $0x28,%rsp
  1c0acd:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  1c0ad0:	48 c7 45 d0 28 13 1c 	movq   $0x1c1328,-0x30(%rbp)
  1c0ad7:	00 
  1c0ad8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  1c0adc:	48 01 f7             	add    %rsi,%rdi
  1c0adf:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  1c0ae3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  1c0aea:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  1c0aeb:	be 00 00 00 00       	mov    $0x0,%esi
  1c0af0:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1c0af4:	e8 3b f7 ff ff       	call   1c0234 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  1c0af9:	48 85 db             	test   %rbx,%rbx
  1c0afc:	74 16                	je     1c0b14 <vsnprintf+0x54>
  1c0afe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  1c0b02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1c0b06:	48 39 c2             	cmp    %rax,%rdx
  1c0b09:	73 05                	jae    1c0b10 <vsnprintf+0x50>
        *sp.s_ = 0;
  1c0b0b:	c6 02 00             	movb   $0x0,(%rdx)
  1c0b0e:	eb 04                	jmp    1c0b14 <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  1c0b10:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  1c0b14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1c0b18:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  1c0b1c:	c9                   	leave  
  1c0b1d:	c3                   	ret    

00000000001c0b1e <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  1c0b1e:	f3 0f 1e fa          	endbr64 
  1c0b22:	55                   	push   %rbp
  1c0b23:	48 89 e5             	mov    %rsp,%rbp
  1c0b26:	48 83 ec 50          	sub    $0x50,%rsp
  1c0b2a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1c0b2e:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1c0b32:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  1c0b36:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1c0b3d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1c0b41:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1c0b45:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1c0b49:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  1c0b4d:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1c0b51:	e8 6a ff ff ff       	call   1c0ac0 <vsnprintf>
    va_end(val);
    return n;
  1c0b56:	48 98                	cltq   
}
  1c0b58:	c9                   	leave  
  1c0b59:	c3                   	ret    

00000000001c0b5a <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  1c0b5a:	f3 0f 1e fa          	endbr64 
  1c0b5e:	55                   	push   %rbp
  1c0b5f:	48 89 e5             	mov    %rsp,%rbp
  1c0b62:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  1c0b69:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  1c0b6c:	c7 05 86 84 ef ff 30 	movl   $0x730,-0x107b7a(%rip)        # b8ffc <cursorpos>
  1c0b73:	07 00 00 
    char buf[240];
    if (description) {
  1c0b76:	48 85 c9             	test   %rcx,%rcx
  1c0b79:	74 39                	je     1c0bb4 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  1c0b7b:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  1c0b7e:	48 83 ec 08          	sub    $0x8,%rsp
  1c0b82:	52                   	push   %rdx
  1c0b83:	56                   	push   %rsi
  1c0b84:	57                   	push   %rdi
  1c0b85:	48 89 f9             	mov    %rdi,%rcx
  1c0b88:	ba 30 13 1c 00       	mov    $0x1c1330,%edx
  1c0b8d:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0b92:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0b99:	b0 00                	mov    $0x0,%al
  1c0b9b:	e8 7e ff ff ff       	call   1c0b1e <snprintf>
  1c0ba0:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  1c0ba4:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  1c0ba9:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0bb0:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  1c0bb2:	eb fe                	jmp    1c0bb2 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  1c0bb4:	49 89 d1             	mov    %rdx,%r9
  1c0bb7:	48 89 f9             	mov    %rdi,%rcx
  1c0bba:	ba 60 13 1c 00       	mov    $0x1c1360,%edx
  1c0bbf:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0bc4:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0bcb:	b0 00                	mov    $0x0,%al
  1c0bcd:	e8 4c ff ff ff       	call   1c0b1e <snprintf>
  1c0bd2:	eb d0                	jmp    1c0ba4 <assert_fail(char const*, int, char const*, char const*)+0x4a>
