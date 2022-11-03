
obj/p-allocator2.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000140000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  140000:	f3 0f 1e fa          	endbr64 
  140004:	55                   	push   %rbp
  140005:	48 89 e5             	mov    %rsp,%rbp
  140008:	41 54                	push   %r12
  14000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  14000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  140010:	0f 05                	syscall 
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  140012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  140015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  140017:	89 c7                	mov    %eax,%edi
  140019:	e8 a8 01 00 00       	call   1401c6 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  14001e:	ba 1b 30 14 00       	mov    $0x14301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  140023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  14002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 142008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  140031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  140034:	48 83 e8 01          	sub    $0x1,%rax
  140038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  14003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 142000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  140045:	48 39 c2             	cmp    %rax,%rdx
  140048:	75 4f                	jne    140099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  14004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  14004f:	0f 05                	syscall 
    return rax;
  140051:	eb f7                	jmp    14004a <process_main()+0x4a>
            }
            // check that the page starts out all zero
            for (unsigned long* l = (unsigned long*) heap_top;
                 l != (unsigned long*) (heap_top + PAGESIZE);
                 ++l) {
                assert(*l == 0);
  140053:	b9 00 00 00 00       	mov    $0x0,%ecx
  140058:	ba e0 0b 14 00       	mov    $0x140be0,%edx
  14005d:	be 24 00 00 00       	mov    $0x24,%esi
  140062:	bf e8 0b 14 00       	mov    $0x140be8,%edi
  140067:	e8 ee 0a 00 00       	call   140b5a <assert_fail(char const*, int, char const*, char const*)>
            }
            // check we can write to new page
            *heap_top = p;
  14006c:	44 88 21             	mov    %r12b,(%rcx)
            // check we can write to console
            console[CPOS(24, 79)] = p;
  14006f:	66 44 89 25 27 8f f7 	mov    %r12w,-0x870d9(%rip)        # b8f9e <console+0xf9e>
  140076:	ff 
            // update `heap_top`
            heap_top += PAGESIZE;
  140077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 142008 <heap_top>
  14007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  140082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  140087:	0f 05                	syscall 
    while (heap_top != stack_bottom) {
  140089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 142000 <stack_bottom>
  140090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 142008 <heap_top>
  140097:	74 b1                	je     14004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  140099:	be 63 00 00 00       	mov    $0x63,%esi
  14009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1400a3:	e8 3d 01 00 00       	call   1401e5 <rand(int, int)>
  1400a8:	39 d8                	cmp    %ebx,%eax
  1400aa:	7d d6                	jge    140082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1400ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1400b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 142008 <heap_top>
  1400b8:	0f 05                	syscall 
            if (sys_page_alloc(heap_top) < 0) {
  1400ba:	85 c0                	test   %eax,%eax
  1400bc:	78 8c                	js     14004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1400be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 142008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1400c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1400cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1400cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1400d3:	0f 85 7a ff ff ff    	jne    140053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1400d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1400dd:	48 39 d0             	cmp    %rdx,%rax
  1400e0:	75 ed                	jne    1400cf <process_main()+0xcf>
  1400e2:	eb 88                	jmp    14006c <process_main()+0x6c>

00000000001400e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1400e4:	f3 0f 1e fa          	endbr64 
        if (s_ < end_) {
  1400e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1400ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1400f0:	73 0b                	jae    1400fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1400f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1400f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1400fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1400fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  140102:	c3                   	ret    

0000000000140103 <strlen>:
size_t strlen(const char* s) {
  140103:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
  140107:	80 3f 00             	cmpb   $0x0,(%rdi)
  14010a:	74 10                	je     14011c <strlen+0x19>
  14010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  140111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  140115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  140119:	75 f6                	jne    140111 <strlen+0xe>
  14011b:	c3                   	ret    
  14011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  140121:	c3                   	ret    

0000000000140122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  140122:	f3 0f 1e fa          	endbr64 
  140126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  140129:	ba 00 00 00 00       	mov    $0x0,%edx
  14012e:	48 85 f6             	test   %rsi,%rsi
  140131:	74 11                	je     140144 <strnlen+0x22>
  140133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  140137:	74 0c                	je     140145 <strnlen+0x23>
        ++n;
  140139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  14013d:	48 39 d0             	cmp    %rdx,%rax
  140140:	75 f1                	jne    140133 <strnlen+0x11>
  140142:	eb 04                	jmp    140148 <strnlen+0x26>
  140144:	c3                   	ret    
  140145:	48 89 d0             	mov    %rdx,%rax
}
  140148:	c3                   	ret    

0000000000140149 <strchr>:
char* strchr(const char* s, int c) {
  140149:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
  14014d:	0f b6 07             	movzbl (%rdi),%eax
  140150:	84 c0                	test   %al,%al
  140152:	74 10                	je     140164 <strchr+0x1b>
  140154:	40 38 f0             	cmp    %sil,%al
  140157:	74 18                	je     140171 <strchr+0x28>
        ++s;
  140159:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  14015d:	0f b6 07             	movzbl (%rdi),%eax
  140160:	84 c0                	test   %al,%al
  140162:	75 f0                	jne    140154 <strchr+0xb>
        return nullptr;
  140164:	40 84 f6             	test   %sil,%sil
  140167:	b8 00 00 00 00       	mov    $0x0,%eax
  14016c:	48 0f 44 c7          	cmove  %rdi,%rax
}
  140170:	c3                   	ret    
  140171:	48 89 f8             	mov    %rdi,%rax
  140174:	c3                   	ret    

0000000000140175 <rand()>:
int rand() {
  140175:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  140179:	83 3d 98 1e 00 00 00 	cmpl   $0x0,0x1e98(%rip)        # 142018 <rand_seed_set>
  140180:	74 27                	je     1401a9 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  140182:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  140189:	f4 51 58 
  14018c:	48 0f af 05 7c 1e 00 	imul   0x1e7c(%rip),%rax        # 142010 <rand_seed>
  140193:	00 
  140194:	48 83 c0 01          	add    $0x1,%rax
  140198:	48 89 05 71 1e 00 00 	mov    %rax,0x1e71(%rip)        # 142010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  14019f:	48 c1 e8 20          	shr    $0x20,%rax
  1401a3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1401a8:	c3                   	ret    
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401a9:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1401b0:	87 d4 30 
  1401b3:	48 89 05 56 1e 00 00 	mov    %rax,0x1e56(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401ba:	c7 05 54 1e 00 00 01 	movl   $0x1,0x1e54(%rip)        # 142018 <rand_seed_set>
  1401c1:	00 00 00 
}
  1401c4:	eb bc                	jmp    140182 <rand()+0xd>

00000000001401c6 <srand(unsigned int)>:
void srand(unsigned seed) {
  1401c6:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401ca:	89 f8                	mov    %edi,%eax
  1401cc:	48 c1 e7 20          	shl    $0x20,%rdi
  1401d0:	48 09 c7             	or     %rax,%rdi
  1401d3:	48 89 3d 36 1e 00 00 	mov    %rdi,0x1e36(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401da:	c7 05 34 1e 00 00 01 	movl   $0x1,0x1e34(%rip)        # 142018 <rand_seed_set>
  1401e1:	00 00 00 
}
  1401e4:	c3                   	ret    

00000000001401e5 <rand(int, int)>:
int rand(int min, int max) {
  1401e5:	f3 0f 1e fa          	endbr64 
  1401e9:	55                   	push   %rbp
  1401ea:	48 89 e5             	mov    %rsp,%rbp
  1401ed:	41 54                	push   %r12
  1401ef:	53                   	push   %rbx
    assert(min <= max);
  1401f0:	39 f7                	cmp    %esi,%edi
  1401f2:	7f 26                	jg     14021a <rand(int, int)+0x35>
  1401f4:	41 89 fc             	mov    %edi,%r12d
  1401f7:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1401f9:	e8 77 ff ff ff       	call   140175 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1401fe:	44 29 e3             	sub    %r12d,%ebx
  140201:	83 c3 01             	add    $0x1,%ebx
  140204:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  140207:	48 98                	cltq   
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  140209:	48 0f af d8          	imul   %rax,%rbx
  14020d:	48 c1 eb 1f          	shr    $0x1f,%rbx
  140211:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  140215:	5b                   	pop    %rbx
  140216:	41 5c                	pop    %r12
  140218:	5d                   	pop    %rbp
  140219:	c3                   	ret    
    assert(min <= max);
  14021a:	b9 00 00 00 00       	mov    $0x0,%ecx
  14021f:	ba f7 0b 14 00       	mov    $0x140bf7,%edx
  140224:	be 45 01 00 00       	mov    $0x145,%esi
  140229:	bf 02 0c 14 00       	mov    $0x140c02,%edi
  14022e:	e8 27 09 00 00       	call   140b5a <assert_fail(char const*, int, char const*, char const*)>
  140233:	90                   	nop

0000000000140234 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  140234:	f3 0f 1e fa          	endbr64 
  140238:	55                   	push   %rbp
  140239:	48 89 e5             	mov    %rsp,%rbp
  14023c:	41 57                	push   %r15
  14023e:	41 56                	push   %r14
  140240:	41 55                	push   %r13
  140242:	41 54                	push   %r12
  140244:	53                   	push   %rbx
  140245:	48 83 ec 58          	sub    $0x58,%rsp
  140249:	49 89 fe             	mov    %rdi,%r14
  14024c:	89 75 ac             	mov    %esi,-0x54(%rbp)
  14024f:	49 89 d4             	mov    %rdx,%r12
  140252:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  140256:	0f b6 02             	movzbl (%rdx),%eax
  140259:	84 c0                	test   %al,%al
  14025b:	0f 85 cc 05 00 00    	jne    14082d <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
}
  140261:	48 83 c4 58          	add    $0x58,%rsp
  140265:	5b                   	pop    %rbx
  140266:	41 5c                	pop    %r12
  140268:	41 5d                	pop    %r13
  14026a:	41 5e                	pop    %r14
  14026c:	41 5f                	pop    %r15
  14026e:	5d                   	pop    %rbp
  14026f:	c3                   	ret    
        for (++format; *format; ++format) {
  140270:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
  140275:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
  14027b:	84 db                	test   %bl,%bl
  14027d:	0f 84 f4 07 00 00    	je     140a77 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
  140283:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
  140289:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
  14028f:	0f be f3             	movsbl %bl,%esi
  140292:	bf 11 13 14 00       	mov    $0x141311,%edi
  140297:	e8 ad fe ff ff       	call   140149 <strchr>
  14029c:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  14029f:	48 85 c0             	test   %rax,%rax
  1402a2:	74 70                	je     140314 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1402a4:	48 81 e9 11 13 14 00 	sub    $0x141311,%rcx
  1402ab:	44 89 e0             	mov    %r12d,%eax
  1402ae:	d3 e0                	shl    %cl,%eax
  1402b0:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1402b3:	49 83 c7 01          	add    $0x1,%r15
  1402b7:	41 0f b6 1f          	movzbl (%r15),%ebx
  1402bb:	84 db                	test   %bl,%bl
  1402bd:	75 d0                	jne    14028f <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
  1402bf:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
  1402c3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1402c9:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
  1402d0:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
  1402d4:	0f 84 c8 00 00 00    	je     1403a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
  1402da:	41 0f b6 07          	movzbl (%r15),%eax
  1402de:	3c 6c                	cmp    $0x6c,%al
  1402e0:	0f 84 50 01 00 00    	je     140436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  1402e6:	0f 8f 3e 01 00 00    	jg     14042a <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
  1402ec:	3c 68                	cmp    $0x68,%al
  1402ee:	0f 85 62 01 00 00    	jne    140456 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
  1402f4:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  1402f8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1402fd:	8d 50 bd             	lea    -0x43(%rax),%edx
  140300:	80 fa 35             	cmp    $0x35,%dl
  140303:	0f 87 de 05 00 00    	ja     1408e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  140309:	0f b6 d2             	movzbl %dl,%edx
  14030c:	3e ff 24 d5 20 0c 14 	notrack jmp *0x140c20(,%rdx,8)
  140313:	00 
        if (*format >= '1' && *format <= '9') {
  140314:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  140318:	8d 43 cf             	lea    -0x31(%rbx),%eax
  14031b:	3c 08                	cmp    $0x8,%al
  14031d:	77 34                	ja     140353 <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  14031f:	41 0f b6 07          	movzbl (%r15),%eax
  140323:	8d 50 d0             	lea    -0x30(%rax),%edx
  140326:	80 fa 09             	cmp    $0x9,%dl
  140329:	77 61                	ja     14038c <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
  14032b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  140331:	49 83 c7 01          	add    $0x1,%r15
  140335:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  14033a:	0f be c0             	movsbl %al,%eax
  14033d:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  140342:	41 0f b6 07          	movzbl (%r15),%eax
  140346:	8d 50 d0             	lea    -0x30(%rax),%edx
  140349:	80 fa 09             	cmp    $0x9,%dl
  14034c:	76 e3                	jbe    140331 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
  14034e:	e9 76 ff ff ff       	jmp    1402c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
  140353:	80 fb 2a             	cmp    $0x2a,%bl
  140356:	75 3f                	jne    140397 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
  140358:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14035c:	8b 07                	mov    (%rdi),%eax
  14035e:	83 f8 2f             	cmp    $0x2f,%eax
  140361:	77 17                	ja     14037a <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  140363:	89 c2                	mov    %eax,%edx
  140365:	48 03 57 10          	add    0x10(%rdi),%rdx
  140369:	83 c0 08             	add    $0x8,%eax
  14036c:	89 07                	mov    %eax,(%rdi)
  14036e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  140371:	49 83 c7 01          	add    $0x1,%r15
  140375:	e9 4f ff ff ff       	jmp    1402c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
  14037a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14037e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140382:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140386:	48 89 41 08          	mov    %rax,0x8(%rcx)
  14038a:	eb e2                	jmp    14036e <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  14038c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  140392:	e9 32 ff ff ff       	jmp    1402c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
  140397:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  14039d:	e9 27 ff ff ff       	jmp    1402c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
  1403a2:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
  1403a6:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  1403ab:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1403ae:	80 f9 09             	cmp    $0x9,%cl
  1403b1:	76 13                	jbe    1403c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
  1403b3:	3c 2a                	cmp    $0x2a,%al
  1403b5:	74 33                	je     1403ea <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
  1403b7:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
  1403ba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  1403c1:	e9 14 ff ff ff       	jmp    1402da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403c6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1403cb:	48 83 c2 01          	add    $0x1,%rdx
  1403cf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1403d2:	0f be c0             	movsbl %al,%eax
  1403d5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403d9:	0f b6 02             	movzbl (%rdx),%eax
  1403dc:	8d 70 d0             	lea    -0x30(%rax),%esi
  1403df:	40 80 fe 09          	cmp    $0x9,%sil
  1403e3:	76 e6                	jbe    1403cb <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
  1403e5:	49 89 d7             	mov    %rdx,%r15
  1403e8:	eb 1c                	jmp    140406 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
  1403ea:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1403ee:	8b 01                	mov    (%rcx),%eax
  1403f0:	83 f8 2f             	cmp    $0x2f,%eax
  1403f3:	77 23                	ja     140418 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
  1403f5:	89 c2                	mov    %eax,%edx
  1403f7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1403fb:	83 c0 08             	add    $0x8,%eax
  1403fe:	89 01                	mov    %eax,(%rcx)
  140400:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  140402:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
  140406:	85 c9                	test   %ecx,%ecx
  140408:	b8 00 00 00 00       	mov    $0x0,%eax
  14040d:	0f 49 c1             	cmovns %ecx,%eax
  140410:	89 45 a8             	mov    %eax,-0x58(%rbp)
  140413:	e9 c2 fe ff ff       	jmp    1402da <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
  140418:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14041c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140420:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140424:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140428:	eb d6                	jmp    140400 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
  14042a:	3c 74                	cmp    $0x74,%al
  14042c:	74 08                	je     140436 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
  14042e:	3c 7a                	cmp    $0x7a,%al
  140430:	0f 85 77 06 00 00    	jne    140aad <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
  140436:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
  14043a:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  14043f:	8d 50 bd             	lea    -0x43(%rax),%edx
  140442:	80 fa 35             	cmp    $0x35,%dl
  140445:	0f 87 9c 04 00 00    	ja     1408e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
  14044b:	0f b6 d2             	movzbl %dl,%edx
  14044e:	3e ff 24 d5 d0 0d 14 	notrack jmp *0x140dd0(,%rdx,8)
  140455:	00 
  140456:	8d 50 bd             	lea    -0x43(%rax),%edx
  140459:	80 fa 35             	cmp    $0x35,%dl
  14045c:	0f 87 82 04 00 00    	ja     1408e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
  140462:	0f b6 d2             	movzbl %dl,%edx
  140465:	3e ff 24 d5 80 0f 14 	notrack jmp *0x140f80(,%rdx,8)
  14046c:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  14046d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140471:	8b 07                	mov    (%rdi),%eax
  140473:	83 f8 2f             	cmp    $0x2f,%eax
  140476:	77 3a                	ja     1404b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
  140478:	89 c2                	mov    %eax,%edx
  14047a:	48 03 57 10          	add    0x10(%rdi),%rdx
  14047e:	83 c0 08             	add    $0x8,%eax
  140481:	89 07                	mov    %eax,(%rdi)
  140483:	48 8b 12             	mov    (%rdx),%rdx
  140486:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  140489:	48 89 d0             	mov    %rdx,%rax
  14048c:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  140490:	49 89 d2             	mov    %rdx,%r10
  140493:	49 f7 da             	neg    %r10
  140496:	25 00 01 00 00       	and    $0x100,%eax
  14049b:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  14049f:	0b 45 a0             	or     -0x60(%rbp),%eax
  1404a2:	0c c0                	or     $0xc0,%al
  1404a4:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
  1404a7:	41 bc 11 0c 14 00    	mov    $0x140c11,%r12d
            break;
  1404ad:	e9 ec 01 00 00       	jmp    14069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1404b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1404b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1404ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1404be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1404c2:	eb bf                	jmp    140483 <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
  1404c4:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1404c7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1404cb:	8b 01                	mov    (%rcx),%eax
  1404cd:	83 f8 2f             	cmp    $0x2f,%eax
  1404d0:	77 10                	ja     1404e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
  1404d2:	89 c2                	mov    %eax,%edx
  1404d4:	48 03 51 10          	add    0x10(%rcx),%rdx
  1404d8:	83 c0 08             	add    $0x8,%eax
  1404db:	89 01                	mov    %eax,(%rcx)
  1404dd:	48 63 12             	movslq (%rdx),%rdx
  1404e0:	eb a7                	jmp    140489 <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
  1404e2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1404e6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1404ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1404ee:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1404f2:	eb e9                	jmp    1404dd <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
  1404f4:	49 89 cf             	mov    %rcx,%r15
  1404f7:	b8 01 00 00 00       	mov    $0x1,%eax
  1404fc:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  140502:	e9 8f 00 00 00       	jmp    140596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  140507:	49 89 cf             	mov    %rcx,%r15
  14050a:	b8 00 00 00 00       	mov    $0x0,%eax
  14050f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  140515:	eb 7f                	jmp    140596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  140517:	b8 00 00 00 00       	mov    $0x0,%eax
  14051c:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  140522:	eb 72                	jmp    140596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
  140524:	b8 00 00 00 00       	mov    $0x0,%eax
  140529:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
  14052f:	eb 65                	jmp    140596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  140531:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140535:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140539:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14053d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140541:	eb 6d                	jmp    1405b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
  140543:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140547:	8b 07                	mov    (%rdi),%eax
  140549:	83 f8 2f             	cmp    $0x2f,%eax
  14054c:	77 10                	ja     14055e <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
  14054e:	89 c2                	mov    %eax,%edx
  140550:	48 03 57 10          	add    0x10(%rdi),%rdx
  140554:	83 c0 08             	add    $0x8,%eax
  140557:	89 07                	mov    %eax,(%rdi)
  140559:	44 8b 12             	mov    (%rdx),%r10d
  14055c:	eb 55                	jmp    1405b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
  14055e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140562:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140566:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14056a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  14056e:	eb e9                	jmp    140559 <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
  140570:	49 89 cf             	mov    %rcx,%r15
  140573:	b8 01 00 00 00       	mov    $0x1,%eax
  140578:	eb 16                	jmp    140590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  14057a:	49 89 cf             	mov    %rcx,%r15
  14057d:	b8 00 00 00 00       	mov    $0x0,%eax
  140582:	eb 0c                	jmp    140590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  140584:	b8 00 00 00 00       	mov    $0x0,%eax
  140589:	eb 05                	jmp    140590 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
  14058b:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  140590:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  140596:	85 c0                	test   %eax,%eax
  140598:	74 a9                	je     140543 <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
  14059a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14059e:	8b 01                	mov    (%rcx),%eax
  1405a0:	83 f8 2f             	cmp    $0x2f,%eax
  1405a3:	77 8c                	ja     140531 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
  1405a5:	89 c2                	mov    %eax,%edx
  1405a7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1405ab:	83 c0 08             	add    $0x8,%eax
  1405ae:	89 01                	mov    %eax,(%rcx)
  1405b0:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
  1405b3:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
  1405b7:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
  1405ba:	41 b9 00 13 14 00    	mov    $0x141300,%r9d
    if (base < 0) {
  1405c0:	45 85 c0             	test   %r8d,%r8d
  1405c3:	79 0c                	jns    1405d1 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
  1405c5:	45 89 c3             	mov    %r8d,%r11d
  1405c8:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
  1405cb:	41 b9 e0 12 14 00    	mov    $0x1412e0,%r9d
    *--pos = '\0';
  1405d1:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1405d5:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  1405d9:	0f 84 49 03 00 00    	je     140928 <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1405df:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  1405e6:	41 83 f8 0a          	cmp    $0xa,%r8d
  1405ea:	0f 94 c0             	sete   %al
  1405ed:	0f b6 c0             	movzbl %al,%eax
  1405f0:	48 83 e8 04          	sub    $0x4,%rax
  1405f4:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1405f9:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1405fd:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
  140600:	49 63 f0             	movslq %r8d,%rsi
  140603:	e9 5d 03 00 00       	jmp    140965 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
  140608:	49 89 cf             	mov    %rcx,%r15
  14060b:	b8 01 00 00 00       	mov    $0x1,%eax
  140610:	eb 16                	jmp    140628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  140612:	49 89 cf             	mov    %rcx,%r15
  140615:	b8 00 00 00 00       	mov    $0x0,%eax
  14061a:	eb 0c                	jmp    140628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  14061c:	b8 00 00 00 00       	mov    $0x0,%eax
  140621:	eb 05                	jmp    140628 <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
  140623:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  140628:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
  14062e:	e9 63 ff ff ff       	jmp    140596 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
  140633:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
  140636:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14063a:	8b 01                	mov    (%rcx),%eax
  14063c:	83 f8 2f             	cmp    $0x2f,%eax
  14063f:	77 25                	ja     140666 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
  140641:	89 c2                	mov    %eax,%edx
  140643:	48 03 51 10          	add    0x10(%rcx),%rdx
  140647:	83 c0 08             	add    $0x8,%eax
  14064a:	89 01                	mov    %eax,(%rcx)
  14064c:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  14064f:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
  140656:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
  14065c:	e9 64 ff ff ff       	jmp    1405c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
  140661:	49 89 cf             	mov    %rcx,%r15
  140664:	eb d0                	jmp    140636 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
  140666:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14066a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  14066e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140672:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140676:	eb d4                	jmp    14064c <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
  140678:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
  14067b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14067f:	8b 07                	mov    (%rdi),%eax
  140681:	83 f8 2f             	cmp    $0x2f,%eax
  140684:	0f 87 c6 01 00 00    	ja     140850 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
  14068a:	89 c2                	mov    %eax,%edx
  14068c:	48 03 57 10          	add    0x10(%rdi),%rdx
  140690:	83 c0 08             	add    $0x8,%eax
  140693:	89 07                	mov    %eax,(%rdi)
  140695:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  140698:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
  14069e:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1406a1:	83 e0 40             	and    $0x40,%eax
  1406a4:	89 45 98             	mov    %eax,-0x68(%rbp)
  1406a7:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
  1406ad:	0f 85 d0 03 00 00    	jne    140a83 <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1406b3:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1406b6:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1406b9:	25 c0 00 00 00       	and    $0xc0,%eax
  1406be:	3d c0 00 00 00       	cmp    $0xc0,%eax
  1406c3:	0f 84 c4 02 00 00    	je     14098d <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1406c9:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1406cc:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
  1406cf:	bb 11 0c 14 00       	mov    $0x140c11,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1406d4:	83 f8 41             	cmp    $0x41,%eax
  1406d7:	0f 84 e6 02 00 00    	je     1409c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1406dd:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  1406e0:	89 c8                	mov    %ecx,%eax
  1406e2:	f7 d0                	not    %eax
  1406e4:	c1 e8 1f             	shr    $0x1f,%eax
  1406e7:	89 45 88             	mov    %eax,-0x78(%rbp)
  1406ea:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1406ee:	0f 85 0a 03 00 00    	jne    1409fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
  1406f4:	84 c0                	test   %al,%al
  1406f6:	0f 84 02 03 00 00    	je     1409fe <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
  1406fc:	48 63 f1             	movslq %ecx,%rsi
  1406ff:	4c 89 e7             	mov    %r12,%rdi
  140702:	e8 1b fa ff ff       	call   140122 <strnlen>
  140707:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  14070a:	8b 45 8c             	mov    -0x74(%rbp),%eax
  14070d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  140710:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  140717:	83 f8 42             	cmp    $0x42,%eax
  14071a:	0f 84 16 03 00 00    	je     140a36 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
  140720:	48 89 df             	mov    %rbx,%rdi
  140723:	e8 db f9 ff ff       	call   140103 <strlen>
  140728:	8b 55 a8             	mov    -0x58(%rbp),%edx
  14072b:	03 55 9c             	add    -0x64(%rbp),%edx
  14072e:	44 89 e9             	mov    %r13d,%ecx
  140731:	29 d1                	sub    %edx,%ecx
  140733:	29 c1                	sub    %eax,%ecx
  140735:	89 4d 98             	mov    %ecx,-0x68(%rbp)
  140738:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  14073b:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
  14073f:	75 39                	jne    14077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
  140741:	85 c9                	test   %ecx,%ecx
  140743:	7e 35                	jle    14077a <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
  140745:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
  140749:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  14074c:	49 8b 06             	mov    (%r14),%rax
  14074f:	89 da                	mov    %ebx,%edx
  140751:	be 20 00 00 00       	mov    $0x20,%esi
  140756:	4c 89 f7             	mov    %r14,%rdi
  140759:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  14075b:	41 83 ed 01          	sub    $0x1,%r13d
  14075f:	45 85 ed             	test   %r13d,%r13d
  140762:	7f e8                	jg     14074c <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
  140764:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  140768:	8b 7d 98             	mov    -0x68(%rbp),%edi
  14076b:	85 ff                	test   %edi,%edi
  14076d:	b8 01 00 00 00       	mov    $0x1,%eax
  140772:	0f 4f c7             	cmovg  %edi,%eax
  140775:	29 c7                	sub    %eax,%edi
  140777:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  14077a:	0f b6 03             	movzbl (%rbx),%eax
  14077d:	84 c0                	test   %al,%al
  14077f:	74 25                	je     1407a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
  140781:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  140785:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
  140789:	0f b6 f0             	movzbl %al,%esi
  14078c:	49 8b 06             	mov    (%r14),%rax
  14078f:	44 89 e2             	mov    %r12d,%edx
  140792:	4c 89 f7             	mov    %r14,%rdi
  140795:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  140797:	48 83 c3 01          	add    $0x1,%rbx
  14079b:	0f b6 03             	movzbl (%rbx),%eax
  14079e:	84 c0                	test   %al,%al
  1407a0:	75 e7                	jne    140789 <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
  1407a2:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
  1407a6:	8b 5d a8             	mov    -0x58(%rbp),%ebx
  1407a9:	85 db                	test   %ebx,%ebx
  1407ab:	7e 21                	jle    1407ce <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
  1407ad:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
  1407b1:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
  1407b5:	49 8b 06             	mov    (%r14),%rax
  1407b8:	44 89 e2             	mov    %r12d,%edx
  1407bb:	be 30 00 00 00       	mov    $0x30,%esi
  1407c0:	4c 89 f7             	mov    %r14,%rdi
  1407c3:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1407c5:	83 eb 01             	sub    $0x1,%ebx
  1407c8:	75 eb                	jne    1407b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
  1407ca:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
  1407ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1407d1:	85 c0                	test   %eax,%eax
  1407d3:	7e 2a                	jle    1407ff <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
  1407d5:	89 c3                	mov    %eax,%ebx
  1407d7:	4c 01 e3             	add    %r12,%rbx
  1407da:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
  1407de:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
  1407e2:	41 0f b6 34 24       	movzbl (%r12),%esi
  1407e7:	49 8b 06             	mov    (%r14),%rax
  1407ea:	44 89 ea             	mov    %r13d,%edx
  1407ed:	4c 89 f7             	mov    %r14,%rdi
  1407f0:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1407f2:	49 83 c4 01          	add    $0x1,%r12
  1407f6:	4c 39 e3             	cmp    %r12,%rbx
  1407f9:	75 e7                	jne    1407e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
  1407fb:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
  1407ff:	45 85 ed             	test   %r13d,%r13d
  140802:	7e 18                	jle    14081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
  140804:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
  140807:	49 8b 06             	mov    (%r14),%rax
  14080a:	89 da                	mov    %ebx,%edx
  14080c:	be 20 00 00 00       	mov    $0x20,%esi
  140811:	4c 89 f7             	mov    %r14,%rdi
  140814:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  140816:	41 83 ed 01          	sub    $0x1,%r13d
  14081a:	75 eb                	jne    140807 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
  14081c:	4d 8d 67 01          	lea    0x1(%r15),%r12
  140820:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
  140825:	84 c0                	test   %al,%al
  140827:	0f 84 34 fa ff ff    	je     140261 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  14082d:	3c 25                	cmp    $0x25,%al
  14082f:	0f 84 3b fa ff ff    	je     140270 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  140835:	0f b6 f0             	movzbl %al,%esi
  140838:	49 8b 06             	mov    (%r14),%rax
  14083b:	8b 55 ac             	mov    -0x54(%rbp),%edx
  14083e:	4c 89 f7             	mov    %r14,%rdi
  140841:	ff 10                	call   *(%rax)
            continue;
  140843:	4d 89 e7             	mov    %r12,%r15
  140846:	eb d4                	jmp    14081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  140848:	49 89 cf             	mov    %rcx,%r15
  14084b:	e9 2b fe ff ff       	jmp    14067b <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
  140850:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140854:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140858:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14085c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140860:	e9 30 fe ff ff       	jmp    140695 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
  140865:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
  140868:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14086c:	8b 01                	mov    (%rcx),%eax
  14086e:	83 f8 2f             	cmp    $0x2f,%eax
  140871:	77 17                	ja     14088a <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
  140873:	89 c2                	mov    %eax,%edx
  140875:	48 03 51 10          	add    0x10(%rcx),%rdx
  140879:	83 c0 08             	add    $0x8,%eax
  14087c:	89 01                	mov    %eax,(%rcx)
  14087e:	8b 02                	mov    (%rdx),%eax
  140880:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
  140883:	eb 97                	jmp    14081c <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
  140885:	49 89 cf             	mov    %rcx,%r15
  140888:	eb de                	jmp    140868 <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
  14088a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14088e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140892:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140896:	48 89 47 08          	mov    %rax,0x8(%rdi)
  14089a:	eb e2                	jmp    14087e <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
  14089c:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
  14089f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1408a3:	8b 07                	mov    (%rdi),%eax
  1408a5:	83 f8 2f             	cmp    $0x2f,%eax
  1408a8:	77 28                	ja     1408d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
  1408aa:	89 c2                	mov    %eax,%edx
  1408ac:	48 03 57 10          	add    0x10(%rdi),%rdx
  1408b0:	83 c0 08             	add    $0x8,%eax
  1408b3:	89 07                	mov    %eax,(%rdi)
  1408b5:	8b 02                	mov    (%rdx),%eax
  1408b7:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1408ba:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1408be:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1408c2:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
  1408c8:	e9 d1 fd ff ff       	jmp    14069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
  1408cd:	49 89 cf             	mov    %rcx,%r15
  1408d0:	eb cd                	jmp    14089f <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
  1408d2:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1408d6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1408da:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1408de:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1408e2:	eb d1                	jmp    1408b5 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
  1408e4:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
  1408e7:	84 c0                	test   %al,%al
  1408e9:	0f 85 6f 01 00 00    	jne    140a5e <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
  1408ef:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1408f3:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1408f7:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
  1408fb:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  1408ff:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  140905:	e9 94 fd ff ff       	jmp    14069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
  14090a:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  140910:	41 b9 00 13 14 00    	mov    $0x141300,%r9d
    if (flags & FLAG_THOUSANDS) {
  140916:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
  14091c:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  140923:	e9 cc fc ff ff       	jmp    1405f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
  140928:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  14092f:	bf 00 00 00 00       	mov    $0x0,%edi
  140934:	e9 c0 fc ff ff       	jmp    1405f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
  140939:	49 89 cc             	mov    %rcx,%r12
  14093c:	ba 00 00 00 00       	mov    $0x0,%edx
  140941:	48 f7 f6             	div    %rsi
  140944:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  140949:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  14094b:	48 83 e9 01          	sub    $0x1,%rcx
  14094f:	48 85 c0             	test   %rax,%rax
  140952:	0f 84 5b fd ff ff    	je     1406b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
  140958:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  14095c:	49 39 d4             	cmp    %rdx,%r12
  14095f:	0f 84 4e fd ff ff    	je     1406b3 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
  140965:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  140969:	48 39 d7             	cmp    %rdx,%rdi
  14096c:	75 cb                	jne    140939 <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
  14096e:	49 89 cc             	mov    %rcx,%r12
  140971:	41 83 f8 0a          	cmp    $0xa,%r8d
  140975:	0f 94 c2             	sete   %dl
  140978:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  14097c:	40 0f 94 c7          	sete   %dil
  140980:	40 0f b6 ff          	movzbl %dil,%edi
  140984:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  140986:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  14098b:	eb be                	jmp    14094b <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
  14098d:	bb 0e 0c 14 00       	mov    $0x140c0e,%ebx
            if (flags & FLAG_NEGATIVE) {
  140992:	8b 45 a0             	mov    -0x60(%rbp),%eax
  140995:	f6 c4 01             	test   $0x1,%ah
  140998:	0f 85 3f fd ff ff    	jne    1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
  14099e:	bb 09 0c 14 00       	mov    $0x140c09,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1409a3:	a8 10                	test   $0x10,%al
  1409a5:	0f 85 32 fd ff ff    	jne    1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
  1409ab:	a8 08                	test   $0x8,%al
  1409ad:	ba 11 0c 14 00       	mov    $0x140c11,%edx
  1409b2:	b8 10 0c 14 00       	mov    $0x140c10,%eax
  1409b7:	48 0f 44 c2          	cmove  %rdx,%rax
  1409bb:	48 89 c3             	mov    %rax,%rbx
  1409be:	e9 1a fd ff ff       	jmp    1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
  1409c3:	41 8d 43 10          	lea    0x10(%r11),%eax
  1409c7:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1409cc:	0f 85 0b fd ff ff    	jne    1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
  1409d2:	4d 85 d2             	test   %r10,%r10
  1409d5:	75 0d                	jne    1409e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
  1409d7:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
  1409de:	0f 84 f9 fc ff ff    	je     1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
  1409e4:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
  1409e8:	ba 12 0c 14 00       	mov    $0x140c12,%edx
  1409ed:	b8 0b 0c 14 00       	mov    $0x140c0b,%eax
  1409f2:	48 0f 44 c2          	cmove  %rdx,%rax
  1409f6:	48 89 c3             	mov    %rax,%rbx
  1409f9:	e9 df fc ff ff       	jmp    1406dd <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
  1409fe:	4c 89 e7             	mov    %r12,%rdi
  140a01:	e8 fd f6 ff ff       	call   140103 <strlen>
  140a06:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  140a09:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  140a0d:	0f 84 f7 fc ff ff    	je     14070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
  140a13:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  140a17:	0f 84 ed fc ff ff    	je     14070a <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
  140a1d:	8b 4d a8             	mov    -0x58(%rbp),%ecx
  140a20:	89 ca                	mov    %ecx,%edx
  140a22:	29 c2                	sub    %eax,%edx
  140a24:	39 c1                	cmp    %eax,%ecx
  140a26:	b8 00 00 00 00       	mov    $0x0,%eax
  140a2b:	0f 4f c2             	cmovg  %edx,%eax
  140a2e:	89 45 a8             	mov    %eax,-0x58(%rbp)
  140a31:	e9 ea fc ff ff       	jmp    140720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
  140a36:	48 89 df             	mov    %rbx,%rdi
  140a39:	e8 c5 f6 ff ff       	call   140103 <strlen>
  140a3e:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  140a41:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  140a44:	44 89 e9             	mov    %r13d,%ecx
  140a47:	29 f9                	sub    %edi,%ecx
  140a49:	29 c1                	sub    %eax,%ecx
  140a4b:	44 39 ea             	cmp    %r13d,%edx
  140a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  140a53:	0f 4c c1             	cmovl  %ecx,%eax
  140a56:	89 45 a8             	mov    %eax,-0x58(%rbp)
  140a59:	e9 c2 fc ff ff       	jmp    140720 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
  140a5e:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
  140a61:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  140a64:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  140a68:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
  140a6c:	41 ba 00 00 00 00    	mov    $0x0,%r10d
  140a72:	e9 27 fc ff ff       	jmp    14069e <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
  140a77:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  140a7e:	e9 40 f8 ff ff       	jmp    1402c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
  140a83:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  140a87:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
  140a8b:	0f 85 79 fe ff ff    	jne    14090a <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
  140a91:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
  140a97:	41 b9 00 13 14 00    	mov    $0x141300,%r9d
    if (flags & FLAG_THOUSANDS) {
  140a9d:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
  140aa3:	bf 00 00 00 00       	mov    $0x0,%edi
  140aa8:	e9 4c fb ff ff       	jmp    1405f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
  140aad:	8d 50 bd             	lea    -0x43(%rax),%edx
  140ab0:	80 fa 35             	cmp    $0x35,%dl
  140ab3:	77 ac                	ja     140a61 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
  140ab5:	0f b6 d2             	movzbl %dl,%edx
  140ab8:	3e ff 24 d5 30 11 14 	notrack jmp *0x141130(,%rdx,8)
  140abf:	00 

0000000000140ac0 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  140ac0:	f3 0f 1e fa          	endbr64 
  140ac4:	55                   	push   %rbp
  140ac5:	48 89 e5             	mov    %rsp,%rbp
  140ac8:	53                   	push   %rbx
  140ac9:	48 83 ec 28          	sub    $0x28,%rsp
  140acd:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  140ad0:	48 c7 45 d0 28 13 14 	movq   $0x141328,-0x30(%rbp)
  140ad7:	00 
  140ad8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  140adc:	48 01 f7             	add    %rsi,%rdi
  140adf:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  140ae3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  140aea:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  140aeb:	be 00 00 00 00       	mov    $0x0,%esi
  140af0:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  140af4:	e8 3b f7 ff ff       	call   140234 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  140af9:	48 85 db             	test   %rbx,%rbx
  140afc:	74 16                	je     140b14 <vsnprintf+0x54>
  140afe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  140b02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  140b06:	48 39 c2             	cmp    %rax,%rdx
  140b09:	73 05                	jae    140b10 <vsnprintf+0x50>
        *sp.s_ = 0;
  140b0b:	c6 02 00             	movb   $0x0,(%rdx)
  140b0e:	eb 04                	jmp    140b14 <vsnprintf+0x54>
    } else if (size) {
        sp.end_[-1] = 0;
  140b10:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
    }
    return sp.n_;
}
  140b14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  140b18:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  140b1c:	c9                   	leave  
  140b1d:	c3                   	ret    

0000000000140b1e <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  140b1e:	f3 0f 1e fa          	endbr64 
  140b22:	55                   	push   %rbp
  140b23:	48 89 e5             	mov    %rsp,%rbp
  140b26:	48 83 ec 50          	sub    $0x50,%rsp
  140b2a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  140b2e:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  140b32:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  140b36:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  140b3d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  140b41:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  140b45:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  140b49:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  140b4d:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  140b51:	e8 6a ff ff ff       	call   140ac0 <vsnprintf>
    va_end(val);
    return n;
  140b56:	48 98                	cltq   
}
  140b58:	c9                   	leave  
  140b59:	c3                   	ret    

0000000000140b5a <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  140b5a:	f3 0f 1e fa          	endbr64 
  140b5e:	55                   	push   %rbp
  140b5f:	48 89 e5             	mov    %rsp,%rbp
  140b62:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  140b69:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  140b6c:	c7 05 86 84 f7 ff 30 	movl   $0x730,-0x87b7a(%rip)        # b8ffc <cursorpos>
  140b73:	07 00 00 
    char buf[240];
    if (description) {
  140b76:	48 85 c9             	test   %rcx,%rcx
  140b79:	74 39                	je     140bb4 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  140b7b:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  140b7e:	48 83 ec 08          	sub    $0x8,%rsp
  140b82:	52                   	push   %rdx
  140b83:	56                   	push   %rsi
  140b84:	57                   	push   %rdi
  140b85:	48 89 f9             	mov    %rdi,%rcx
  140b88:	ba 30 13 14 00       	mov    $0x141330,%edx
  140b8d:	be f0 00 00 00       	mov    $0xf0,%esi
  140b92:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140b99:	b0 00                	mov    $0x0,%al
  140b9b:	e8 7e ff ff ff       	call   140b1e <snprintf>
  140ba0:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  140ba4:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  140ba9:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140bb0:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  140bb2:	eb fe                	jmp    140bb2 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  140bb4:	49 89 d1             	mov    %rdx,%r9
  140bb7:	48 89 f9             	mov    %rdi,%rcx
  140bba:	ba 60 13 14 00       	mov    $0x141360,%edx
  140bbf:	be f0 00 00 00       	mov    $0xf0,%esi
  140bc4:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140bcb:	b0 00                	mov    $0x0,%al
  140bcd:	e8 4c ff ff ff       	call   140b1e <snprintf>
  140bd2:	eb d0                	jmp    140ba4 <assert_fail(char const*, int, char const*, char const*)+0x4a>
