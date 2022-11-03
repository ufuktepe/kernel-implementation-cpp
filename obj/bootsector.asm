
obj/bootsector.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000007c00 <boot_start>:
    7c00:	fa                   	cli    
    7c01:	fc                   	cld    
    7c02:	bc                   	.byte 0xbc
    7c03:	00                   	.byte 0x0
    7c04:	7c                   	.byte 0x7c

0000000000007c05 <notify_bios64>:
    7c05:	b8 00 ec ba 02       	mov    $0x2baec00,%eax
    7c0a:	00 cd                	add    %cl,%ch
    7c0c:	15                   	.byte 0x15

0000000000007c0d <init_boot_pagetable>:
    7c0d:	66 bf 00 10          	mov    $0x1000,%di
    7c11:	00 00                	add    %al,(%rax)
    7c13:	66 31 c0             	xor    %ax,%ax
    7c16:	66 b9 00 08          	mov    $0x800,%cx
    7c1a:	00 00                	add    %al,(%rax)
    7c1c:	66 f3 ab             	rep stos %ax,%es:(%rdi)
    7c1f:	66 bf 00 10          	mov    $0x1000,%di
    7c23:	00 00                	add    %al,(%rax)
    7c25:	67 66 8d 8f 03 10 00 	lea    0x1003(%edi),%cx
    7c2c:	00 
    7c2d:	67 66 89 0f          	mov    %cx,(%edi)
    7c31:	67 66 89 8f 00 08 00 	mov    %cx,0x800(%edi)
    7c38:	00 
    7c39:	67 66 89 8f f8 0f 00 	mov    %cx,0xff8(%edi)
    7c40:	00 
    7c41:	67 66 c7 41 fd 83 00 	movw   $0x83,-0x3(%ecx)
    7c48:	00 00                	add    %al,(%rax)
    7c4a:	67 66 c7 81 ed 0f 00 	movw   $0x83,0xfed(%ecx)
    7c51:	00 83 00 
	...

0000000000007c56 <real_to_prot>:
    7c56:	0f 20 e0             	mov    %cr4,%rax
    7c59:	66 83 c8 30          	or     $0x30,%ax
    7c5d:	0f 22 e0             	mov    %rax,%cr4
    7c60:	0f 22 df             	mov    %rdi,%cr3
    7c63:	66 b9 80 00          	mov    $0x80,%cx
    7c67:	00 c0                	add    %al,%al
    7c69:	0f 32                	rdmsr  
    7c6b:	66 0d 01 09          	or     $0x901,%ax
    7c6f:	00 00                	add    %al,(%rax)
    7c71:	0f 30                	wrmsr  
    7c73:	0f 20 c0             	mov    %cr0,%rax
    7c76:	66 0d 01 00          	or     $0x1,%ax
    7c7a:	01 80 0f 22 c0 0f    	add    %eax,0xfc0220f(%rax)
    7c80:	01 16                	add    %edx,(%rsi)
    7c82:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    7c83:	7c ea                	jl     7c6f <real_to_prot+0x19>
    7c85:	86 7d 08             	xchg   %bh,0x8(%rbp)
    7c88:	00 0f                	add    %cl,(%rdi)
    7c8a:	1f                   	(bad)  
    7c8b:	80 00 00             	addb   $0x0,(%rax)
	...

0000000000007c90 <gdt>:
	...
    7c9c:	00                   	.byte 0x0
    7c9d:	9a                   	(bad)  
    7c9e:	20 00                	and    %al,(%rax)

0000000000007ca0 <gdtdesc>:
    7ca0:	00 00                	add    %al,(%rax)
    7ca2:	00 00                	add    %al,(%rax)
    7ca4:	00 00                	add    %al,(%rax)
    7ca6:	0f 00 90 7c 00 00 00 	lldt   0x7c(%rax)
    7cad:	00 00                	add    %al,(%rax)
	...

0000000000007cb0 <boot_readseg>:
//    Load an ELF segment at virtual address `dst` from the IDE disk's sector
//    `src_sect`. Copies `filesz` bytes into memory at `dst` from sectors
//    `src_sect` and up, then clears memory in the range
//    `[dst+filesz, dst+memsz)`.
static void boot_readseg(uintptr_t ptr, uint32_t src_sect,
                         size_t filesz, size_t memsz) {
    7cb0:	41 57                	push   %r15
    uintptr_t end_ptr = ptr + filesz;
    memsz += ptr;
    7cb2:	48 8d 04 0f          	lea    (%rdi,%rcx,1),%rax
                         size_t filesz, size_t memsz) {
    7cb6:	41 89 f0             	mov    %esi,%r8d

    // round down to sector boundary
    ptr &= ~(SECTORSIZE - 1);
    7cb9:	48 89 fe             	mov    %rdi,%rsi
                         size_t filesz, size_t memsz) {
    7cbc:	41 56                	push   %r14
    uintptr_t end_ptr = ptr + filesz;
    7cbe:	4c 8d 0c 17          	lea    (%rdi,%rdx,1),%r9
    ptr &= ~(SECTORSIZE - 1);
    7cc2:	48 81 e6 00 fe ff ff 	and    $0xfffffffffffffe00,%rsi
                 : "d" (port)
                 : "cc");
}

__always_inline void outb(int port, uint8_t data) {
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
    7cc9:	41 b7 20             	mov    $0x20,%r15b
                         size_t filesz, size_t memsz) {
    7ccc:	41 55                	push   %r13
    7cce:	41 be f6 01 00 00    	mov    $0x1f6,%r14d
    7cd4:	41 bd f5 01 00 00    	mov    $0x1f5,%r13d
    asm volatile("cld; rep; insl"
    7cda:	41 bb f0 01 00 00    	mov    $0x1f0,%r11d
    7ce0:	41 54                	push   %r12
    7ce2:	41 ba 80 00 00 00    	mov    $0x80,%r10d
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
    7ce8:	41 bc f4 01 00 00    	mov    $0x1f4,%r12d
    7cee:	55                   	push   %rbp
    7cef:	bd f3 01 00 00       	mov    $0x1f3,%ebp
    7cf4:	53                   	push   %rbx
    7cf5:	bb f2 01 00 00       	mov    $0x1f2,%ebx
    memsz += ptr;
    7cfa:	48 89 44 24 f8       	mov    %rax,-0x8(%rsp)

    // read sectors
    for (; ptr < end_ptr; ptr += SECTORSIZE, ++src_sect) {
    7cff:	4c 39 ce             	cmp    %r9,%rsi
    7d02:	73 67                	jae    7d6b <boot_readseg+0xbb>
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
    7d04:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7d09:	ec                   	in     (%dx),%al
// boot_waitdisk
//    Wait for the disk to be ready.
static void boot_waitdisk() {
    // Wait until the ATA status register says ready (0x40 is on)
    // & not busy (0x80 is off)
    while ((inb(0x1F7) & 0xC0) != 0x40) {
    7d0a:	83 e0 c0             	and    $0xffffffc0,%eax
    7d0d:	3c 40                	cmp    $0x40,%al
    7d0f:	75 f3                	jne    7d04 <boot_readseg+0x54>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
    7d11:	b0 01                	mov    $0x1,%al
    7d13:	89 da                	mov    %ebx,%edx
    7d15:	ee                   	out    %al,(%dx)
    7d16:	44 89 c0             	mov    %r8d,%eax
    7d19:	89 ea                	mov    %ebp,%edx
    7d1b:	ee                   	out    %al,(%dx)
static void boot_readsect(uintptr_t dst, uint32_t src_sect) {
    // programmed I/O for "read sector"
    boot_waitdisk();
    outb(0x1F2, 1);             // send `count = 1` as an ATA argument
    outb(0x1F3, src_sect);      // send `src_sect`, the sector number
    outb(0x1F4, src_sect >> 8);
    7d1c:	44 89 c0             	mov    %r8d,%eax
    7d1f:	44 89 e2             	mov    %r12d,%edx
    7d22:	c1 e8 08             	shr    $0x8,%eax
    7d25:	ee                   	out    %al,(%dx)
    outb(0x1F5, src_sect >> 16);
    7d26:	44 89 c0             	mov    %r8d,%eax
    7d29:	44 89 ea             	mov    %r13d,%edx
    7d2c:	c1 e8 10             	shr    $0x10,%eax
    7d2f:	ee                   	out    %al,(%dx)
    outb(0x1F6, (src_sect >> 24) | 0xE0);
    7d30:	44 89 c0             	mov    %r8d,%eax
    7d33:	44 89 f2             	mov    %r14d,%edx
    7d36:	c1 e8 18             	shr    $0x18,%eax
    7d39:	83 c8 e0             	or     $0xffffffe0,%eax
    7d3c:	ee                   	out    %al,(%dx)
    7d3d:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7d42:	44 89 f8             	mov    %r15d,%eax
    7d45:	ee                   	out    %al,(%dx)
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
    7d46:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7d4b:	ec                   	in     (%dx),%al
    while ((inb(0x1F7) & 0xC0) != 0x40) {
    7d4c:	83 e0 c0             	and    $0xffffffc0,%eax
    7d4f:	3c 40                	cmp    $0x40,%al
    7d51:	75 f3                	jne    7d46 <boot_readseg+0x96>
    asm volatile("cld; rep; insl"
    7d53:	48 89 f7             	mov    %rsi,%rdi
    7d56:	44 89 d1             	mov    %r10d,%ecx
    7d59:	44 89 da             	mov    %r11d,%edx
    7d5c:	fc                   	cld    
    7d5d:	f3 6d                	rep insl (%dx),%es:(%rdi)
    for (; ptr < end_ptr; ptr += SECTORSIZE, ++src_sect) {
    7d5f:	48 81 c6 00 02 00 00 	add    $0x200,%rsi
    7d66:	41 ff c0             	inc    %r8d
    7d69:	eb 94                	jmp    7cff <boot_readseg+0x4f>
    for (; end_ptr < memsz; ++end_ptr) {
    7d6b:	4c 3b 4c 24 f8       	cmp    -0x8(%rsp),%r9
    7d70:	73 09                	jae    7d7b <boot_readseg+0xcb>
        *(uint8_t*) end_ptr = 0;
    7d72:	41 c6 01 00          	movb   $0x0,(%r9)
    for (; end_ptr < memsz; ++end_ptr) {
    7d76:	49 ff c1             	inc    %r9
    7d79:	eb f0                	jmp    7d6b <boot_readseg+0xbb>
}
    7d7b:	5b                   	pop    %rbx
    7d7c:	5d                   	pop    %rbp
    7d7d:	41 5c                	pop    %r12
    7d7f:	41 5d                	pop    %r13
    7d81:	41 5e                	pop    %r14
    7d83:	41 5f                	pop    %r15
    7d85:	c3                   	ret    

0000000000007d86 <boot>:
[[noreturn]] void boot() {
    7d86:	f3 0f 1e fa          	endbr64 
    7d8a:	55                   	push   %rbp
    boot_readseg((uintptr_t) ELFHDR, KERNEL_START_SECTOR,
    7d8b:	b9 00 10 00 00       	mov    $0x1000,%ecx
    7d90:	ba 00 10 00 00       	mov    $0x1000,%edx
    7d95:	be 01 00 00 00       	mov    $0x1,%esi
[[noreturn]] void boot() {
    7d9a:	53                   	push   %rbx
    boot_readseg((uintptr_t) ELFHDR, KERNEL_START_SECTOR,
    7d9b:	bf 00 30 00 00       	mov    $0x3000,%edi
[[noreturn]] void boot() {
    7da0:	50                   	push   %rax
    boot_readseg((uintptr_t) ELFHDR, KERNEL_START_SECTOR,
    7da1:	e8 0a ff ff ff       	call   7cb0 <boot_readseg>
    elf_program* eph = ph + ELFHDR->e_phnum;
    7da6:	0f b7 2c 25 38 30 00 	movzwl 0x3038,%ebp
    7dad:	00 
    elf_program* ph = (elf_program*) ((uint8_t*) ELFHDR + ELFHDR->e_phoff);
    7dae:	48 8b 04 25 20 30 00 	mov    0x3020,%rax
    7db5:	00 
    elf_program* eph = ph + ELFHDR->e_phnum;
    7db6:	48 6b ed 38          	imul   $0x38,%rbp,%rbp
    elf_program* ph = (elf_program*) ((uint8_t*) ELFHDR + ELFHDR->e_phoff);
    7dba:	48 8d 98 00 30 00 00 	lea    0x3000(%rax),%rbx
    elf_program* eph = ph + ELFHDR->e_phnum;
    7dc1:	48 01 dd             	add    %rbx,%rbp
    for (; ph < eph; ++ph) {
    7dc4:	48 39 eb             	cmp    %rbp,%rbx
    7dc7:	73 21                	jae    7dea <boot+0x64>
                     KERNEL_START_SECTOR + ph->p_offset / SECTORSIZE,
    7dc9:	48 8b 73 08          	mov    0x8(%rbx),%rsi
        boot_readseg(ph->p_va,
    7dcd:	48 8b 4b 28          	mov    0x28(%rbx),%rcx
    for (; ph < eph; ++ph) {
    7dd1:	48 83 c3 38          	add    $0x38,%rbx
        boot_readseg(ph->p_va,
    7dd5:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
    7dd9:	48 8b 7b d8          	mov    -0x28(%rbx),%rdi
                     KERNEL_START_SECTOR + ph->p_offset / SECTORSIZE,
    7ddd:	48 c1 ee 09          	shr    $0x9,%rsi
        boot_readseg(ph->p_va,
    7de1:	ff c6                	inc    %esi
    7de3:	e8 c8 fe ff ff       	call   7cb0 <boot_readseg>
    for (; ph < eph; ++ph) {
    7de8:	eb da                	jmp    7dc4 <boot+0x3e>
    kernel_entry();
    7dea:	ff 14 25 18 30 00 00 	call   *0x3018
