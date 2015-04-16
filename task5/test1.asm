	.file	"test1.c"
	.intel_syntax noprefix
	.text
	.globl	_Z3moov
	.type	_Z3moov, @function
_Z3moov:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [eax], 1
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [eax+4], 15
	nop
	mov	eax, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-12]
	xor	edx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE0:
	.size	_Z3moov, .-_Z3moov
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
