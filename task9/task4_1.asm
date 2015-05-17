	.file	"task4.cpp"
	.section	.text._ZN7FakturaC2Eddd,"axG",@progbits,_ZN7FakturaC5Eddd,comdat
	.align 2
	.weak	_ZN7FakturaC2Eddd
	.type	_ZN7FakturaC2Eddd, @function
_ZN7FakturaC2Eddd:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movsd	%xmm0, -16(%rbp)
	movsd	%xmm1, -24(%rbp)
	movsd	%xmm2, -32(%rbp)
	movl	_ZN7Faktura6nextIDE(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, _ZN7Faktura6nextIDE(%rip)
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	cvtsd2ss	-16(%rbp), %xmm3
	movd	%xmm3, %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 4(%rdx)
	cvtsd2ss	-32(%rbp), %xmm4
	movd	%xmm4, %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 8(%rdx)
	cvtsd2ss	-24(%rbp), %xmm5
	movd	%xmm5, %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 12(%rdx)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN7FakturaC2Eddd, .-_ZN7FakturaC2Eddd
	.weak	_ZN7FakturaC1Eddd
	.set	_ZN7FakturaC1Eddd,_ZN7FakturaC2Eddd
	.globl	_ZN7Faktura6nextIDE
	.bss
	.align 4
	.type	_ZN7Faktura6nextIDE, @object
	.size	_ZN7Faktura6nextIDE, 4
_ZN7Faktura6nextIDE:
	.zero	4
	.text
	.globl	_Z7podatek7Faktura
	.type	_Z7podatek7Faktura, @function
_Z7podatek7Faktura:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, %rax
	movq	%xmm0, %rcx
	movq	%rcx, %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	movss	-20(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z7podatek7Faktura, .-_Z7podatek7Faktura
	.globl	_Z6wypiszRK7Faktura
	.type	_Z6wypiszRK7Faktura, @function
_Z6wypiszRK7Faktura:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z6wypiszRK7Faktura, .-_Z6wypiszRK7Faktura
	.section	.rodata
.LC3:
	.string	"Podatek : %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$4636737291354636288, %rsi
	movabsq	$4597454643604897137, %rcx
	movabsq	$4652007308841189376, %rdx
	leaq	-32(%rbp), %rax
	movq	%rsi, -40(%rbp)
	movsd	-40(%rbp), %xmm2
	movq	%rcx, -40(%rbp)
	movsd	-40(%rbp), %xmm1
	movq	%rdx, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	%rax, %rdi
	call	_ZN7FakturaC1Eddd
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %xmm0
	call	_Z7podatek7Faktura
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_Z6wypiszRK7Faktura
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
