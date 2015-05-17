	.file	"func_names.cpp"
	.intel_syntax noprefix
	.text
	.globl	_Z4diffiPfS_S_
	.type	_Z4diffiPfS_S_, @function
_Z4diffiPfS_S_:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-4], edi
	mov	QWORD PTR [rbp-16], rsi
	mov	QWORD PTR [rbp-24], rdx
	mov	QWORD PTR [rbp-32], rcx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4diffiPfS_S_, .-_Z4diffiPfS_S_
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
