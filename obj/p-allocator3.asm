
obj/p-allocator3.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000180000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  180000:	f3 0f 1e fa          	endbr64 
  180004:	55                   	push   %rbp
  180005:	48 89 e5             	mov    %rsp,%rbp
  180008:	41 54                	push   %r12
  18000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  18000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  180010:	0f 05                	syscall 
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  180012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  180015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  180017:	89 c7                	mov    %eax,%edi
  180019:	e8 a8 01 00 00       	call   1801c6 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  18001e:	ba 1b 30 18 00       	mov    $0x18301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  180023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  18002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 182008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  180031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  180034:	48 83 e8 01          	sub    $0x1,%rax
  180038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  18003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 182000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  180045:	48 39 c2             	cmp    %rax,%rdx
  180048:	75 4f                	jne    180099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  18004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  18004f:	0f 05                	syscall 
    return rax;
  180051:	eb f7                	jmp    18004a <process_main()+0x4a>
            }
            // check that the page starts out all zero
            for (unsigned long* l = (unsigned long*) heap_top;
                 l != (unsigned long*) (heap_top + PAGESIZE);
                 ++l) {
                assert(*l == 0);
  180053:	b9 00 00 00 00       	mov    $0x0,%ecx
  180058:	ba e0 0b 18 00       	mov    $0x180be0,%edx
  18005d:	be 24 00 00 00       	mov    $0x24,%esi
  180062:	bf e8 0b 18 00       	mov    $0x180be8,%edi
  180067:	e8 ee 0a 00 00       	call   180b5a <assert_fail(char const*, int, char const*, char const*)>
            }
            // check we can write to new page
            *heap_top = p;
  18006c:	44 88 21             	mov    %r12b,(%rcx)
            // check we can write to console
            console[CPOS(24, 79)] = p;
  18006f:	66 44 89 25 27 8f f3 	mov    %r12w,-0xc70d9(%rip)        # b8f9e <console+0xf9e>
  180076:	ff 
            // update `heap_top`
            heap_top += PAGESIZE;
  180077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 182008 <heap_top>
  18007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  180082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  180087:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  180089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 182000 <stack_bottom>
  180090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 182008 <heap_top>
  180097:	74 b1                	je     18004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  180099:	be 63 00 00 00       	mov    $0x63,%esi
  18009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1800a3:	e8 3d 01 00 00       	call   1801e5 <rand(int, int)>
  1800a8:	39 d8                	cmp    %ebx,%eax
  1800aa:	7d d6                	jge    180082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1800ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1800b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 182008 <heap_top>
  1800b8:	0f 05                	syscall 
            if (sys_page_alloc(heap_top) < 0) {
  1800ba:	85 c0                	test   %eax,%eax
  1800bc:	78 8c                	js     18004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1800be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 182008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1800c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1800cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1800cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1800d3:	0f 85 7a ff ff ff    	jne    180053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1800d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1800dd:	48 39 d0             	cmp    %rdx,%rax
  1800e0:	75 ed                	jne    1800cf <process_main()+0xcf>
  1800e2:	eb 88                	jmp    18006c <process_main()+0x6c>

00000000001800e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1800e4:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  1800e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1800ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1800f0:	73 0b                	jae    1800fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1800f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1800f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1800fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1800fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  180102:	c3                   	ret    

0000000000180103 <strlen>:
size_t strlen(const char* s) {
  180103:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  180107:	80 3f 00             	cmpb   $0x0,(%rdi)
  18010a:	74 10                	je     18011c <strlen+0x19>
  18010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  180111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  180115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  180119:	75 f6                	jne    180111 <strlen+0xe>
  18011b:	c3                   	ret    
  18011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  180121:	c3                   	ret    

0000000000180122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  180122:	f3 0f 1e fa          	endbr64 
  180126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  180129:	ba 00 00 00 00       	mov    $0x0,%edx
  18012e:	48 85 f6             	test   %rsi,%rsi
  180131:	74 11                	je     180144 <strnlen+0x22>
  180133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  180137:	74 0c                	je     180145 <strnlen+0x23>
        ++n;
  180139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  18013d:	48 39 d0             	cmp    %rdx,%rax
  180140:	75 f1                	jne    180133 <strnlen+0x11>
  180142:	eb 04                	jmp    180148 <strnlen+0x26>
  180144:	c3                   	ret    
  180145:	48 89 d0             	mov    %rdx,%rax
}
  180148:	c3                   	ret    

0000000000180149 <strchr>:
char* strchr(const char* s, int c) {
  180149:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  18014d:	0f b6 07             	movzbl (%rdi),%eax
  180150:	84 c0                	test   %al,%al
  180152:	74 10                	je     180164 <strchr+0x1b>
  180154:	40 38 f0             	cmp    %sil,%al
  180157:	74 18                	je     180171 <strchr+0x28>
        ++s;
  180159:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  18015d:	0f b6 07             	movzbl (%rdi),%eax
  180160:	84 c0                	test   %al,%al
  180162:	75 f0                	jne    180154 <strchr+0xb>
        return nullptr;
  180164:	40 84 f6             	test   %sil,%sil
  180167:	b8 00 00 00 00       	mov    $0x0,%eax
  18016c:	48 0f 44 c7          	cmove  %rdi,%rax
}
  180170:	c3                   	ret    
  180171:	48 89 f8             	mov    %rdi,%rax
  180174:	c3                   	ret    

0000000000180175 <rand()>:
int rand() {
  180175:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  180179:	83 3d 98 1e 00 00 00 	cmpl   $0x0,0x1e98(%rip)        # 182018 <rand_seed_set>
  180180:	74 27                	je     1801a9 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  180182:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  180189:	f4 51 58 
  18018c:	48 0f af 05 7c 1e 00 	imul   0x1e7c(%rip),%rax        # 182010 <rand_seed>
  180193:	00 
  180194:	48 83 c0 01          	add    $0x1,%rax
  180198:	48 89 05 71 1e 00 00 	mov    %rax,0x1e71(%rip)        # 182010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  18019f:	48 c1 e8 20          	shr    $0x20,%rax
  1801a3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1801a8:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801a9:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1801b0:	87 d4 30 
  1801b3:	48 89 05 56 1e 00 00 	mov    %rax,0x1e56(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801ba:	c7 05 54 1e 00 00 01 	movl   $0x1,0x1e54(%rip)        # 182018 <rand_seed_set>
  1801c1:	00 00 00 
}
  1801c4:	eb bc                	jmp    180182 <rand()+0xd>

00000000001801c6 <srand(unsigned int)>:
void srand(unsigned seed) {
  1801c6:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801ca:	89 f8                	mov    %edi,%eax
  1801cc:	48 c1 e7 20          	shl    $0x20,%rdi
  1801d0:	48 09 c7             	or     %rax,%rdi
  1801d3:	48 89 3d 36 1e 00 00 	mov    %rdi,0x1e36(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801da:	c7 05 34 1e 00 00 01 	movl   $0x1,0x1e34(%rip)        # 182018 <rand_seed_set>
  1801e1:	00 00 00 
}
  1801e4:	c3                   	ret    

00000000001801e5 <rand(int, int)>:
int rand(int min, int max) {
  1801e5:	f3 0f 1e fa          	endbr64 
  1801e9:	55                   	push   %rbp
  1801ea:	48 89 e5             	mov    %rsp,%rbp
  1801ed:	41 54                	push   %r12
  1801ef:	53                   	push   %rbx
    assert(min <= max);
  1801f0:	39 f7                	cmp    %esi,%edi
  1801f2:	7f 26                	jg     18021a <rand(int, int)+0x35>
  1801f4:	41 89 fc             	mov    %edi,%r12d
  1801f7:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1801f9:	e8 77 ff ff ff       	call   180175 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1801fe:	44 29 e3             	sub    %r12d,%ebx
  180201:	83 c3 01             	add    $0x1,%ebx
  180204:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  180207:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  180209:	48 0f af d8          	imul   %rax,%rbx
  18020d:	48 c1 eb 1f          	shr    $0x1f,%rbx
  180211:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  180215:	5b                   	pop    %rbx
  180216:	41 5c                	pop    %r12
  180218:	5d                   	pop    %rbp
  180219:	c3                   	ret    
    assert(min <= max);
  18021a:	b9 00 00 00 00       	mov    $0x0,%ecx
  18021f:	ba f7 0b 18 00       	mov    $0x180bf7,%edx
  180224:	be 45 01 00 00       	mov    $0x145,%esi
  180229:	bf 02 0c 18 00       	mov    $0x180c02,%edi
  18022e:	e8 27 09 00 00       	call   180b5a <assert_fail(char const*, int, char const*, char const*)>
  180233:	90                   	nop

0000000000180234 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  180234:	f3 0f 1e fa          	endbr64 
  180238:	55                   	push   %rbp
  180239:	48 89 e5             	mov    %rsp,%rbp
  18023c:	41 57                	push   %r15
  18023e:	41 56                	push   %r14
  180240:	41 55                	push   %r13
  180242:	41 54                	push   %r12
  180244:	53                   	push   %rbx
  180245:	48 83 ec 58          	sub    $0x58,%rsp
  180249:	49 89 fe             	mov    %rdi,%r14
  18024c:	89 75 ac             	mov    %esi,-0x54(%rbp)
  18024f:	49 89 d4             	mov    %rdx,%r12
  180252:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  180256:	0f b6 02             	movzbl (%rdx),%eax
  180259:	84 c0                	test   %al,%al
  18025b:	0f 85 cc 05 00 00    	jne    18082d <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  180261:	48 83 c4 58          	add    $0x58,%rsp
  180265:	5b                   	pop    %rbx
  180266:	41 5c                	pop    %r12
  180268:	41 5d                	pop    %r13
  18026a:	41 5e                	pop    %r14
  18026c:	41 5f                	pop    %r15
  18026e:	5d                   	pop    %rbp
  18026f:	c3                   	ret    
        for (++format; *format; ++format) {
  180270:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  180275:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  18027b:	84 db                	test   %bl,%bl
  18027d:	0f 84 f4 07 00 00    	je     180a77 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  180283:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  180289:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  18028f:	0f be f3             	movsbl %bl,%esi
  180292:	bf 11 13 18 00       	mov    $0x181311,%edi
  180297:	e8 ad fe ff ff       	call   180149 <strchr>
  18029c:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  18029f:	48 85 c0             	test   %rax,%rax
  1802a2:	74 70                	je     180314 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1802a4:	48 81 e9 11 13 18 00 	sub    $0x181311,%rcx
  1802ab:	44 89 e0             	mov    %r12d,%eax
  1802ae:	d3 e0                	shl    %cl,%eax
  1802b0:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1802b3:	49 83 c7 01          	add    $0x1,%r15
  1802b7:	41 0f b6 1f          	movzbl (%r15),%ebx
  1802bb:	84 db                	test   %bl,%bl
  1802bd:	75 d0                	jne    18028f <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  1802bf:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  1802c3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1802c9:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  1802d0:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  1802d4:	0f 84 c8 00 00 00    	je     1803a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  1802da:	41 0f b6 07          	movzbl (%r15),%eax
  1802de:	3c 6c                	cmp    $0x6c,%al
  1802e0:	0f 84 50 01 00 00    	je     180436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1802e6:	0f 8f 3e 01 00 00    	jg     18042a <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  1802ec:	3c 68                	cmp    $0x68,%al
  1802ee:	0f 85 62 01 00 00    	jne    180456 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  1802f4:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1802f8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1802fd:	8d 50 bd             	lea    -0x43(%rax),%edx
  180300:	80 fa 35             	cmp    $0x35,%dl
  180303:	0f 87 de 05 00 00    	ja     1808e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  180309:	0f b6 d2             	movzbl %dl,%edx
  18030c:	3e ff 24 d5 20 0c 18 	notrack jmp *0x180c20(,%rdx,8)
  180313:	00 
        if (*format >= '1' && *format <= '9') {
  180314:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  180318:	8d 43 cf             	lea    -0x31(%rbx),%eax
  18031b:	3c 08                	cmp    $0x8,%al
  18031d:	77 34                	ja     180353 <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  18031f:	41 0f b6 07          	movzbl (%r15),%eax
  180323:	8d 50 d0             	lea    -0x30(%rax),%edx
  180326:	80 fa 09             	cmp    $0x9,%dl
  180329:	77 61                	ja     18038c <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  18032b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  180331:	49 83 c7 01          	add    $0x1,%r15
  180335:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  18033a:	0f be c0             	movsbl %al,%eax
  18033d:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  180342:	41 0f b6 07          	movzbl (%r15),%eax
  180346:	8d 50 d0             	lea    -0x30(%rax),%edx
  180349:	80 fa 09             	cmp    $0x9,%dl
  18034c:	76 e3                	jbe    180331 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  18034e:	e9 76 ff ff ff       	jmp    1802c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  180353:	80 fb 2a             	cmp    $0x2a,%bl
  180356:	75 3f                	jne    180397 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  180358:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18035c:	8b 07                	mov    (%rdi),%eax
  18035e:	83 f8 2f             	cmp    $0x2f,%eax
  180361:	77 17                	ja     18037a <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  180363:	89 c2                	mov    %eax,%edx
  180365:	48 03 57 10          	add    0x10(%rdi),%rdx
  180369:	83 c0 08             	add    $0x8,%eax
  18036c:	89 07                	mov    %eax,(%rdi)
  18036e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  180371:	49 83 c7 01          	add    $0x1,%r15
  180375:	e9 4f ff ff ff       	jmp    1802c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  18037a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18037e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180382:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180386:	48 89 41 08          	mov    %rax,0x8(%rcx)
  18038a:	eb e2                	jmp    18036e <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  18038c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  180392:	e9 32 ff ff ff       	jmp    1802c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  180397:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  18039d:	e9 27 ff ff ff       	jmp    1802c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  1803a2:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  1803a6:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1803ab:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1803ae:	80 f9 09             	cmp    $0x9,%cl
  1803b1:	76 13                	jbe    1803c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  1803b3:	3c 2a                	cmp    $0x2a,%al
  1803b5:	74 33                	je     1803ea <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  1803b7:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  1803ba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  1803c1:	e9 14 ff ff ff       	jmp    1802da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803c6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1803cb:	48 83 c2 01          	add    $0x1,%rdx
  1803cf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1803d2:	0f be c0             	movsbl %al,%eax
  1803d5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803d9:	0f b6 02             	movzbl (%rdx),%eax
  1803dc:	8d 70 d0             	lea    -0x30(%rax),%esi
  1803df:	40 80 fe 09          	cmp    $0x9,%sil
  1803e3:	76 e6                	jbe    1803cb <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  1803e5:	49 89 d7             	mov    %rdx,%r15
  1803e8:	eb 1c                	jmp    180406 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  1803ea:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1803ee:	8b 01                	mov    (%rcx),%eax
  1803f0:	83 f8 2f             	cmp    $0x2f,%eax
  1803f3:	77 23                	ja     180418 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  1803f5:	89 c2                	mov    %eax,%edx
  1803f7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1803fb:	83 c0 08             	add    $0x8,%eax
  1803fe:	89 01                	mov    %eax,(%rcx)
  180400:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  180402:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  180406:	85 c9                	test   %ecx,%ecx
  180408:	b8 00 00 00 00       	mov    $0x0,%eax
  18040d:	0f 49 c1             	cmovns %ecx,%eax
  180410:	89 45 a8             	mov    %eax,-0x58(%rbp)
  180413:	e9 c2 fe ff ff       	jmp    1802da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  180418:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18041c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180420:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180424:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180428:	eb d6                	jmp    180400 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  18042a:	3c 74                	cmp    $0x74,%al
  18042c:	74 08                	je     180436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  18042e:	3c 7a                	cmp    $0x7a,%al
  180430:	0f 85 77 06 00 00    	jne    180aad <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  180436:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  18043a:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  18043f:	8d 50 bd             	lea    -0x43(%rax),%edx
  180442:	80 fa 35             	cmp    $0x35,%dl
  180445:	0f 87 9c 04 00 00    	ja     1808e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  18044b:	0f b6 d2             	movzbl %dl,%edx
  18044e:	3e ff 24 d5 d0 0d 18 	notrack jmp *0x180dd0(,%rdx,8)
  180455:	00 
  180456:	8d 50 bd             	lea    -0x43(%rax),%edx
  180459:	80 fa 35             	cmp    $0x35,%dl
  18045c:	0f 87 82 04 00 00    	ja     1808e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  180462:	0f b6 d2             	movzbl %dl,%edx
  180465:	3e ff 24 d5 80 0f 18 	notrack jmp *0x180f80(,%rdx,8)
  18046c:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  18046d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180471:	8b 07                	mov    (%rdi),%eax
  180473:	83 f8 2f             	cmp    $0x2f,%eax
  180476:	77 3a                	ja     1804b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  180478:	89 c2                	mov    %eax,%edx
  18047a:	48 03 57 10          	add    0x10(%rdi),%rdx
  18047e:	83 c0 08             	add    $0x8,%eax
  180481:	89 07                	mov    %eax,(%rdi)
  180483:	48 8b 12             	mov    (%rdx),%rdx
  180486:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  180489:	48 89 d0             	mov    %rdx,%rax
  18048c:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  180490:	49 89 d2             	mov    %rdx,%r10
  180493:	49 f7 da             	neg    %r10
  180496:	25 00 01 00 00       	and    $0x100,%eax
  18049b:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  18049f:	0b 45 a0             	or     -0x60(%rbp),%eax
  1804a2:	0c c0                	or     $0xc0,%al
  1804a4:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  1804a7:	41 bc 11 0c 18 00    	mov    $0x180c11,%r12d
            break;
  1804ad:	e9 ec 01 00 00       	jmp    18069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1804b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1804b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1804ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1804be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1804c2:	eb bf                	jmp    180483 <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  1804c4:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1804c7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1804cb:	8b 01                	mov    (%rcx),%eax
  1804cd:	83 f8 2f             	cmp    $0x2f,%eax
  1804d0:	77 10                	ja     1804e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  1804d2:	89 c2                	mov    %eax,%edx
  1804d4:	48 03 51 10          	add    0x10(%rcx),%rdx
  1804d8:	83 c0 08             	add    $0x8,%eax
  1804db:	89 01                	mov    %eax,(%rcx)
  1804dd:	48 63 12             	movslq (%rdx),%rdx
  1804e0:	eb a7                	jmp    180489 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  1804e2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1804e6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1804ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1804ee:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1804f2:	eb e9                	jmp    1804dd <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  1804f4:	49 89 cf             	mov    %rcx,%r15
  1804f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1804fc:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  180502:	e9 8f 00 00 00       	jmp    180596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  180507:	49 89 cf             	mov    %rcx,%r15
  18050a:	b8 00 00 00 00       	mov    $0x0,%eax
  18050f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  180515:	eb 7f                	jmp    180596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  180517:	b8 00 00 00 00       	mov    $0x0,%eax
  18051c:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  180522:	eb 72                	jmp    180596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  180524:	b8 00 00 00 00       	mov    $0x0,%eax
  180529:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  18052f:	eb 65                	jmp    180596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  180531:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180535:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180539:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18053d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180541:	eb 6d                	jmp    1805b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  180543:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180547:	8b 07                	mov    (%rdi),%eax
  180549:	83 f8 2f             	cmp    $0x2f,%eax
  18054c:	77 10                	ja     18055e <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  18054e:	89 c2                	mov    %eax,%edx
  180550:	48 03 57 10          	add    0x10(%rdi),%rdx
  180554:	83 c0 08             	add    $0x8,%eax
  180557:	89 07                	mov    %eax,(%rdi)
  180559:	44 8b 12             	mov    (%rdx),%r10d
  18055c:	eb 55                	jmp    1805b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  18055e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180562:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180566:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18056a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  18056e:	eb e9                	jmp    180559 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  180570:	49 89 cf             	mov    %rcx,%r15
  180573:	b8 01 00 00 00       	mov    $0x1,%eax
  180578:	eb 16                	jmp    180590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  18057a:	49 89 cf             	mov    %rcx,%r15
  18057d:	b8 00 00 00 00       	mov    $0x0,%eax
  180582:	eb 0c                	jmp    180590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  180584:	b8 00 00 00 00       	mov    $0x0,%eax
  180589:	eb 05                	jmp    180590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  18058b:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  180590:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  180596:	85 c0                	test   %eax,%eax
  180598:	74 a9                	je     180543 <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  18059a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18059e:	8b 01                	mov    (%rcx),%eax
  1805a0:	83 f8 2f             	cmp    $0x2f,%eax
  1805a3:	77 8c                	ja     180531 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  1805a5:	89 c2                	mov    %eax,%edx
  1805a7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1805ab:	83 c0 08             	add    $0x8,%eax
  1805ae:	89 01                	mov    %eax,(%rcx)
  1805b0:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  1805b3:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  1805b7:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  1805ba:	41 b9 00 13 18 00    	mov    $0x181300,%r9d
    if (base < 0) {
  1805c0:	45 85 c0             	test   %r8d,%r8d
  1805c3:	79 0c                	jns    1805d1 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  1805c5:	45 89 c3             	mov    %r8d,%r11d
  1805c8:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  1805cb:	41 b9 e0 12 18 00    	mov    $0x1812e0,%r9d
    *--pos = '\0';
  1805d1:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1805d5:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  1805d9:	0f 84 49 03 00 00    	je     180928 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1805df:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  1805e6:	41 83 f8 0a          	cmp    $0xa,%r8d
  1805ea:	0f 94 c0             	sete   %al
  1805ed:	0f b6 c0             	movzbl %al,%eax
  1805f0:	48 83 e8 04          	sub    $0x4,%rax
  1805f4:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1805f9:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1805fd:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  180600:	49 63 f0             	movslq %r8d,%rsi
  180603:	e9 5d 03 00 00       	jmp    180965 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  180608:	49 89 cf             	mov    %rcx,%r15
  18060b:	b8 01 00 00 00       	mov    $0x1,%eax
  180610:	eb 16                	jmp    180628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  180612:	49 89 cf             	mov    %rcx,%r15
  180615:	b8 00 00 00 00       	mov    $0x0,%eax
  18061a:	eb 0c                	jmp    180628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  18061c:	b8 00 00 00 00       	mov    $0x0,%eax
  180621:	eb 05                	jmp    180628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  180623:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  180628:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  18062e:	e9 63 ff ff ff       	jmp    180596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  180633:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  180636:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18063a:	8b 01                	mov    (%rcx),%eax
  18063c:	83 f8 2f             	cmp    $0x2f,%eax
  18063f:	77 25                	ja     180666 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  180641:	89 c2                	mov    %eax,%edx
  180643:	48 03 51 10          	add    0x10(%rcx),%rdx
  180647:	83 c0 08             	add    $0x8,%eax
  18064a:	89 01                	mov    %eax,(%rcx)
  18064c:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  18064f:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  180656:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  18065c:	e9 64 ff ff ff       	jmp    1805c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  180661:	49 89 cf             	mov    %rcx,%r15
  180664:	eb d0                	jmp    180636 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  180666:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18066a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  18066e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180672:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180676:	eb d4                	jmp    18064c <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  180678:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  18067b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18067f:	8b 07                	mov    (%rdi),%eax
  180681:	83 f8 2f             	cmp    $0x2f,%eax
  180684:	0f 87 c6 01 00 00    	ja     180850 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  18068a:	89 c2                	mov    %eax,%edx
  18068c:	48 03 57 10          	add    0x10(%rdi),%rdx
  180690:	83 c0 08             	add    $0x8,%eax
  180693:	89 07                	mov    %eax,(%rdi)
  180695:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  180698:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  18069e:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1806a1:	83 e0 40             	and    $0x40,%eax
  1806a4:	89 45 98             	mov    %eax,-0x68(%rbp)
  1806a7:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  1806ad:	0f 85 d0 03 00 00    	jne    180a83 <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1806b3:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1806b6:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1806b9:	25 c0 00 00 00       	and    $0xc0,%eax
  1806be:	3d c0 00 00 00       	cmp    $0xc0,%eax
  1806c3:	0f 84 c4 02 00 00    	je     18098d <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1806c9:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1806cc:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  1806cf:	bb 11 0c 18 00       	mov    $0x180c11,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1806d4:	83 f8 41             	cmp    $0x41,%eax
  1806d7:	0f 84 e6 02 00 00    	je     1809c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1806dd:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  1806e0:	89 c8                	mov    %ecx,%eax
  1806e2:	f7 d0                	not    %eax
  1806e4:	c1 e8 1f             	shr    $0x1f,%eax
  1806e7:	89 45 88             	mov    %eax,-0x78(%rbp)
  1806ea:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1806ee:	0f 85 0a 03 00 00    	jne    1809fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  1806f4:	84 c0                	test   %al,%al
  1806f6:	0f 84 02 03 00 00    	je     1809fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  1806fc:	48 63 f1             	movslq %ecx,%rsi
  1806ff:	4c 89 e7             	mov    %r12,%rdi
  180702:	e8 1b fa ff ff       	call   180122 <strnlen>
  180707:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  18070a:	8b 45 8c             	mov    -0x74(%rbp),%eax
  18070d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  180710:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  180717:	83 f8 42             	cmp    $0x42,%eax
  18071a:	0f 84 16 03 00 00    	je     180a36 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  180720:	48 89 df             	mov    %rbx,%rdi
  180723:	e8 db f9 ff ff       	call   180103 <strlen>
  180728:	8b 55 a8             	mov    -0x58(%rbp),%edx
  18072b:	03 55 9c             	add    -0x64(%rbp),%edx
  18072e:	44 89 e9             	mov    %r13d,%ecx
  180731:	29 d1                	sub    %edx,%ecx
  180733:	29 c1                	sub    %eax,%ecx
  180735:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  180738:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  18073b:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  18073f:	75 39                	jne    18077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  180741:	85 c9                	test   %ecx,%ecx
  180743:	7e 35                	jle    18077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  180745:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  180749:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  18074c:	49 8b 06             	mov    (%r14),%rax
  18074f:	89 da                	mov    %ebx,%edx
  180751:	be 20 00 00 00       	mov    $0x20,%esi
  180756:	4c 89 f7             	mov    %r14,%rdi
  180759:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  18075b:	41 83 ed 01          	sub    $0x1,%r13d
  18075f:	45 85 ed             	test   %r13d,%r13d
  180762:	7f e8                	jg     18074c <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  180764:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  180768:	8b 7d 98             	mov    -0x68(%rbp),%edi
  18076b:	85 ff                	test   %edi,%edi
  18076d:	b8 01 00 00 00       	mov    $0x1,%eax
  180772:	0f 4f c7             	cmovg  %edi,%eax
  180775:	29 c7                	sub    %eax,%edi
  180777:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  18077a:	0f b6 03             	movzbl (%rbx),%eax
  18077d:	84 c0                	test   %al,%al
  18077f:	74 25                	je     1807a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  180781:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  180785:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  180789:	0f b6 f0             	movzbl %al,%esi
  18078c:	49 8b 06             	mov    (%r14),%rax
  18078f:	44 89 e2             	mov    %r12d,%edx
  180792:	4c 89 f7             	mov    %r14,%rdi
  180795:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  180797:	48 83 c3 01          	add    $0x1,%rbx
  18079b:	0f b6 03             	movzbl (%rbx),%eax
  18079e:	84 c0                	test   %al,%al
  1807a0:	75 e7                	jne    180789 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  1807a2:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  1807a6:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  1807a9:	85 db                	test   %ebx,%ebx
  1807ab:	7e 21                	jle    1807ce <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  1807ad:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1807b1:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  1807b5:	49 8b 06             	mov    (%r14),%rax
  1807b8:	44 89 e2             	mov    %r12d,%edx
  1807bb:	be 30 00 00 00       	mov    $0x30,%esi
  1807c0:	4c 89 f7             	mov    %r14,%rdi
  1807c3:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1807c5:	83 eb 01             	sub    $0x1,%ebx
  1807c8:	75 eb                	jne    1807b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  1807ca:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  1807ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1807d1:	85 c0                	test   %eax,%eax
  1807d3:	7e 2a                	jle    1807ff <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  1807d5:	89 c3                	mov    %eax,%ebx
  1807d7:	4c 01 e3             	add    %r12,%rbx
  1807da:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1807de:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  1807e2:	41 0f b6 34 24       	movzbl (%r12),%esi
  1807e7:	49 8b 06             	mov    (%r14),%rax
  1807ea:	44 89 ea             	mov    %r13d,%edx
  1807ed:	4c 89 f7             	mov    %r14,%rdi
  1807f0:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1807f2:	49 83 c4 01          	add    $0x1,%r12
  1807f6:	4c 39 e3             	cmp    %r12,%rbx
  1807f9:	75 e7                	jne    1807e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  1807fb:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  1807ff:	45 85 ed             	test   %r13d,%r13d
  180802:	7e 18                	jle    18081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  180804:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  180807:	49 8b 06             	mov    (%r14),%rax
  18080a:	89 da                	mov    %ebx,%edx
  18080c:	be 20 00 00 00       	mov    $0x20,%esi
  180811:	4c 89 f7             	mov    %r14,%rdi
  180814:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  180816:	41 83 ed 01          	sub    $0x1,%r13d
  18081a:	75 eb                	jne    180807 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  18081c:	4d 8d 67 01          	lea    0x1(%r15),%r12
  180820:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  180825:	84 c0                	test   %al,%al
  180827:	0f 84 34 fa ff ff    	je     180261 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  18082d:	3c 25                	cmp    $0x25,%al
  18082f:	0f 84 3b fa ff ff    	je     180270 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  180835:	0f b6 f0             	movzbl %al,%esi
  180838:	49 8b 06             	mov    (%r14),%rax
  18083b:	8b 55 ac             	mov    -0x54(%rbp),%edx
  18083e:	4c 89 f7             	mov    %r14,%rdi
  180841:	ff 10                	call   *(%rax)
            continue;
  180843:	4d 89 e7             	mov    %r12,%r15
  180846:	eb d4                	jmp    18081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  180848:	49 89 cf             	mov    %rcx,%r15
  18084b:	e9 2b fe ff ff       	jmp    18067b <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  180850:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180854:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180858:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18085c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180860:	e9 30 fe ff ff       	jmp    180695 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  180865:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  180868:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18086c:	8b 01                	mov    (%rcx),%eax
  18086e:	83 f8 2f             	cmp    $0x2f,%eax
  180871:	77 17                	ja     18088a <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  180873:	89 c2                	mov    %eax,%edx
  180875:	48 03 51 10          	add    0x10(%rcx),%rdx
  180879:	83 c0 08             	add    $0x8,%eax
  18087c:	89 01                	mov    %eax,(%rcx)
  18087e:	8b 02                	mov    (%rdx),%eax
  180880:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  180883:	eb 97                	jmp    18081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  180885:	49 89 cf             	mov    %rcx,%r15
  180888:	eb de                	jmp    180868 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  18088a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18088e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180892:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180896:	48 89 47 08          	mov    %rax,0x8(%rdi)
  18089a:	eb e2                	jmp    18087e <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  18089c:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  18089f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1808a3:	8b 07                	mov    (%rdi),%eax
  1808a5:	83 f8 2f             	cmp    $0x2f,%eax
  1808a8:	77 28                	ja     1808d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  1808aa:	89 c2                	mov    %eax,%edx
  1808ac:	48 03 57 10          	add    0x10(%rdi),%rdx
  1808b0:	83 c0 08             	add    $0x8,%eax
  1808b3:	89 07                	mov    %eax,(%rdi)
  1808b5:	8b 02                	mov    (%rdx),%eax
  1808b7:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1808ba:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1808be:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1808c2:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  1808c8:	e9 d1 fd ff ff       	jmp    18069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  1808cd:	49 89 cf             	mov    %rcx,%r15
  1808d0:	eb cd                	jmp    18089f <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  1808d2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1808d6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1808da:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1808de:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1808e2:	eb d1                	jmp    1808b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  1808e4:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  1808e7:	84 c0                	test   %al,%al
  1808e9:	0f 85 6f 01 00 00    	jne    180a5e <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  1808ef:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1808f3:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1808f7:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  1808fb:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1808ff:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  180905:	e9 94 fd ff ff       	jmp    18069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  18090a:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  180910:	41 b9 00 13 18 00    	mov    $0x181300,%r9d
    if (flags & FLAG_THOUSANDS) {
  180916:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  18091c:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  180923:	e9 cc fc ff ff       	jmp    1805f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  180928:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  18092f:	bf 00 00 00 00       	mov    $0x0,%edi
  180934:	e9 c0 fc ff ff       	jmp    1805f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  180939:	49 89 cc             	mov    %rcx,%r12
  18093c:	ba 00 00 00 00       	mov    $0x0,%edx
  180941:	48 f7 f6             	div    %rsi
  180944:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  180949:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  18094b:	48 83 e9 01          	sub    $0x1,%rcx
  18094f:	48 85 c0             	test   %rax,%rax
  180952:	0f 84 5b fd ff ff    	je     1806b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  180958:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  18095c:	49 39 d4             	cmp    %rdx,%r12
  18095f:	0f 84 4e fd ff ff    	je     1806b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  180965:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  180969:	48 39 d7             	cmp    %rdx,%rdi
  18096c:	75 cb                	jne    180939 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  18096e:	49 89 cc             	mov    %rcx,%r12
  180971:	41 83 f8 0a          	cmp    $0xa,%r8d
  180975:	0f 94 c2             	sete   %dl
  180978:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  18097c:	40 0f 94 c7          	sete   %dil
  180980:	40 0f b6 ff          	movzbl %dil,%edi
  180984:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  180986:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  18098b:	eb be                	jmp    18094b <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  18098d:	bb 0e 0c 18 00       	mov    $0x180c0e,%ebx
            if (flags & FLAG_NEGATIVE) {
  180992:	8b 45 a0             	mov    -0x60(%rbp),%eax
  180995:	f6 c4 01             	test   $0x1,%ah
  180998:	0f 85 3f fd ff ff    	jne    1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  18099e:	bb 09 0c 18 00       	mov    $0x180c09,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1809a3:	a8 10                	test   $0x10,%al
  1809a5:	0f 85 32 fd ff ff    	jne    1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  1809ab:	a8 08                	test   $0x8,%al
  1809ad:	ba 11 0c 18 00       	mov    $0x180c11,%edx
  1809b2:	b8 10 0c 18 00       	mov    $0x180c10,%eax
  1809b7:	48 0f 44 c2          	cmove  %rdx,%rax
  1809bb:	48 89 c3             	mov    %rax,%rbx
  1809be:	e9 1a fd ff ff       	jmp    1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  1809c3:	41 8d 43 10          	lea    0x10(%r11),%eax
  1809c7:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1809cc:	0f 85 0b fd ff ff    	jne    1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  1809d2:	4d 85 d2             	test   %r10,%r10
  1809d5:	75 0d                	jne    1809e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  1809d7:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  1809de:	0f 84 f9 fc ff ff    	je     1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  1809e4:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  1809e8:	ba 12 0c 18 00       	mov    $0x180c12,%edx
  1809ed:	b8 0b 0c 18 00       	mov    $0x180c0b,%eax
  1809f2:	48 0f 44 c2          	cmove  %rdx,%rax
  1809f6:	48 89 c3             	mov    %rax,%rbx
  1809f9:	e9 df fc ff ff       	jmp    1806dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  1809fe:	4c 89 e7             	mov    %r12,%rdi
  180a01:	e8 fd f6 ff ff       	call   180103 <strlen>
  180a06:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  180a09:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  180a0d:	0f 84 f7 fc ff ff    	je     18070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  180a13:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  180a17:	0f 84 ed fc ff ff    	je     18070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  180a1d:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  180a20:	89 ca                	mov    %ecx,%edx
  180a22:	29 c2                	sub    %eax,%edx
  180a24:	39 c1                	cmp    %eax,%ecx
  180a26:	b8 00 00 00 00       	mov    $0x0,%eax
  180a2b:	0f 4f c2             	cmovg  %edx,%eax
  180a2e:	89 45 a8             	mov    %eax,-0x58(%rbp)
  180a31:	e9 ea fc ff ff       	jmp    180720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  180a36:	48 89 df             	mov    %rbx,%rdi
  180a39:	e8 c5 f6 ff ff       	call   180103 <strlen>
  180a3e:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  180a41:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  180a44:	44 89 e9             	mov    %r13d,%ecx
  180a47:	29 f9                	sub    %edi,%ecx
  180a49:	29 c1                	sub    %eax,%ecx
  180a4b:	44 39 ea             	cmp    %r13d,%edx
  180a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  180a53:	0f 4c c1             	cmovl  %ecx,%eax
  180a56:	89 45 a8             	mov    %eax,-0x58(%rbp)
  180a59:	e9 c2 fc ff ff       	jmp    180720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  180a5e:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  180a61:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  180a64:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  180a68:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  180a6c:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  180a72:	e9 27 fc ff ff       	jmp    18069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  180a77:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  180a7e:	e9 40 f8 ff ff       	jmp    1802c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  180a83:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  180a87:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  180a8b:	0f 85 79 fe ff ff    	jne    18090a <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  180a91:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  180a97:	41 b9 00 13 18 00    	mov    $0x181300,%r9d
    if (flags & FLAG_THOUSANDS) {
  180a9d:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  180aa3:	bf 00 00 00 00       	mov    $0x0,%edi
  180aa8:	e9 4c fb ff ff       	jmp    1805f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  180aad:	8d 50 bd             	lea    -0x43(%rax),%edx
  180ab0:	80 fa 35             	cmp    $0x35,%dl
  180ab3:	77 ac                	ja     180a61 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  180ab5:	0f b6 d2             	movzbl %dl,%edx
  180ab8:	3e ff 24 d5 30 11 18 	notrack jmp *0x181130(,%rdx,8)
  180abf:	00 

0000000000180ac0 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  180ac0:	f3 0f 1e fa          	endbr64 
  180ac4:	55                   	push   %rbp
  180ac5:	48 89 e5             	mov    %rsp,%rbp
  180ac8:	53                   	push   %rbx
  180ac9:	48 83 ec 28          	sub    $0x28,%rsp
  180acd:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  180ad0:	48 c7 45 d0 28 13 18 	movq   $0x181328,-0x30(%rbp)
  180ad7:	00 
  180ad8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  180adc:	48 01 f7             	add    %rsi,%rdi
  180adf:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  180ae3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  180aea:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  180aeb:	be 00 00 00 00       	mov    $0x0,%esi
  180af0:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  180af4:	e8 3b f7 ff ff       	call   180234 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  180af9:	48 85 db             	test   %rbx,%rbx
  180afc:	74 16                	je     180b14 <vsnprintf+0x54>
  180afe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  180b02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  180b06:	48 39 c2             	cmp    %rax,%rdx
  180b09:	73 05                	jae    180b10 <vsnprintf+0x50>
        *sp.s_ = 0;
  180b0b:	c6 02 00             	movb   $0x0,(%rdx)
  180b0e:	eb 04                	jmp    180b14 <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  180b10:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  180b14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  180b18:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  180b1c:	c9                   	leave  
  180b1d:	c3                   	ret    

0000000000180b1e <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  180b1e:	f3 0f 1e fa          	endbr64 
  180b22:	55                   	push   %rbp
  180b23:	48 89 e5             	mov    %rsp,%rbp
  180b26:	48 83 ec 50          	sub    $0x50,%rsp
  180b2a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  180b2e:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  180b32:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  180b36:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  180b3d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  180b41:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  180b45:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  180b49:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  180b4d:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  180b51:	e8 6a ff ff ff       	call   180ac0 <vsnprintf>
    va_end(val);
    return n;
  180b56:	48 98                	cltq   
}
  180b58:	c9                   	leave  
  180b59:	c3                   	ret    

0000000000180b5a <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  180b5a:	f3 0f 1e fa          	endbr64 
  180b5e:	55                   	push   %rbp
  180b5f:	48 89 e5             	mov    %rsp,%rbp
  180b62:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  180b69:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  180b6c:	c7 05 86 84 f3 ff 30 	movl   $0x730,-0xc7b7a(%rip)        # b8ffc <cursorpos>
  180b73:	07 00 00 
    char buf[240];
    if (description) {
  180b76:	48 85 c9             	test   %rcx,%rcx
  180b79:	74 39                	je     180bb4 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  180b7b:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  180b7e:	48 83 ec 08          	sub    $0x8,%rsp
  180b82:	52                   	push   %rdx
  180b83:	56                   	push   %rsi
  180b84:	57                   	push   %rdi
  180b85:	48 89 f9             	mov    %rdi,%rcx
  180b88:	ba 30 13 18 00       	mov    $0x181330,%edx
  180b8d:	be f0 00 00 00       	mov    $0xf0,%esi
  180b92:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180b99:	b0 00                	mov    $0x0,%al
  180b9b:	e8 7e ff ff ff       	call   180b1e <snprintf>
  180ba0:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  180ba4:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  180ba9:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180bb0:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  180bb2:	eb fe                	jmp    180bb2 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  180bb4:	49 89 d1             	mov    %rdx,%r9
  180bb7:	48 89 f9             	mov    %rdi,%rcx
  180bba:	ba 60 13 18 00       	mov    $0x181360,%edx
  180bbf:	be f0 00 00 00       	mov    $0xf0,%esi
  180bc4:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180bcb:	b0 00                	mov    $0x0,%al
  180bcd:	e8 4c ff ff ff       	call   180b1e <snprintf>
  180bd2:	eb d0                	jmp    180ba4 <assert_fail(char const*, int, char const*, char const*)+0x4a>
