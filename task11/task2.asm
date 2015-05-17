	.file	"task2.cpp"
	.intel_syntax noprefix
	.text
	.globl	_Z5dodajPcS_i
	.type	_Z5dodajPcS_i, @function
_Z5dodajPcS_i:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	mov	QWORD PTR [rbp-40], rdi
	mov	QWORD PTR [rbp-48], rsi
	mov	DWORD PTR [rbp-52], edx
	mov	eax, DWORD PTR [rbp-52]
	add	eax, eax
	add	eax, 1
	cdqe
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-24], rax
	mov	rdx, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rbp-40]
	mov	rsi, QWORD PTR [rbp-48]
	mov	ecx, DWORD PTR [rbp-52]
	mov	rdi, rdx
	mov	rbx, rsi
#APP
# 18 "task2.cpp" 1
	movl %ecx, %edx
movl %eax, %esi
rep movsd
movl %edx, %ecx
movl %ebx, %esi
rep movsd
mov $0, %edi

# 0 "" 2
#NO_APP
	mov	rax, QWORD PTR [rbp-24]
	add	rsp, 56
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z5dodajPcS_i, .-_Z5dodajPcS_i
	.section	.rodata
.LC0:
	.string	"moo"
.LC1:
	.string	"foo"
.LC2:
	.string	"s1: %s\n"
.LC3:
	.string	"s2: %s\n"
.LC4:
	.string	"sum: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], OFFSET FLAT:.LC0
	mov	QWORD PTR [rbp-16], OFFSET FLAT:.LC1
	mov	rcx, QWORD PTR [rbp-16]
	mov	rax, QWORD PTR [rbp-24]
	mov	edx, 3
	mov	rsi, rcx
	mov	rdi, rax
	call	_Z5dodajPcS_i
	mov	QWORD PTR [rbp-8], rax
	mov	rax, QWORD PTR [rbp-24]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-16]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC3
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-8]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC4
	mov	eax, 0
	call	printf
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
