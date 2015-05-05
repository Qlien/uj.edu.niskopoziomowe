	.file	"task3.cpp"
	.intel_syntax noprefix
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZN6BigIntC2Ej,"axG",@progbits,_ZN6BigIntC5Ej,comdat
	.align 2
	.weak	_ZN6BigIntC2Ej
	.type	_ZN6BigIntC2Ej, @function
_ZN6BigIntC2Ej:
.LFB1021:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR [ebp+12]
	cmp	eax, 532676608
	ja	.L2
	sal	eax, 2
	jmp	.L3
.L2:
	mov	eax, -1
.L3:
	sub	esp, 12
	push	eax
	call	_Znaj
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+4], edx
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	eax
	call	_Z5zerujPij
	add	esp, 16
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1021:
	.size	_ZN6BigIntC2Ej, .-_ZN6BigIntC2Ej
	.weak	_ZN6BigIntC1Ej
	.set	_ZN6BigIntC1Ej,_ZN6BigIntC2Ej
	.section	.text._ZN6BigIntC2ERKS_,"axG",@progbits,_ZN6BigIntC5ERKS_,comdat
	.align 2
	.weak	_ZN6BigIntC2ERKS_
	.type	_ZN6BigIntC2ERKS_, @function
_ZN6BigIntC2ERKS_:
.LFB1024:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax]
	cmp	eax, 532676608
	ja	.L5
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax]
	sal	eax, 2
	jmp	.L6
.L5:
	mov	eax, -1
.L6:
	sub	esp, 12
	push	eax
	call	_Znaj
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+4], edx
	mov	eax, DWORD PTR [ebp+12]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	sub	esp, 4
	push	ecx
	push	edx
	push	eax
	call	_Z6kopiujPiS_j
	add	esp, 16
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1024:
	.size	_ZN6BigIntC2ERKS_, .-_ZN6BigIntC2ERKS_
	.weak	_ZN6BigIntC1ERKS_
	.set	_ZN6BigIntC1ERKS_,_ZN6BigIntC2ERKS_
	.section	.text._ZN6BigIntC2EPKc,"axG",@progbits,_ZN6BigIntC5EPKc,comdat
	.align 2
	.weak	_ZN6BigIntC2EPKc
	.type	_ZN6BigIntC2EPKc, @function
_ZN6BigIntC2EPKc:
.LFB1027:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-32], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	eax, [ebp-20]
	sub	esp, 4
	push	DWORD PTR [ebp-32]
	push	DWORD PTR [ebp-28]
	push	eax
	call	_ZN6BigInt10fromStringEPKc
	add	esp, 12
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1027:
	.size	_ZN6BigIntC2EPKc, .-_ZN6BigIntC2EPKc
	.weak	_ZN6BigIntC1EPKc
	.set	_ZN6BigIntC1EPKc,_ZN6BigIntC2EPKc
	.section	.text._ZN6BigIntD2Ev,"axG",@progbits,_ZN6BigIntD5Ev,comdat
	.align 2
	.weak	_ZN6BigIntD2Ev
	.type	_ZN6BigIntD2Ev, @function
_ZN6BigIntD2Ev:
.LFB1031:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	test	eax, eax
	je	.L9
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	sub	esp, 12
	push	eax
	call	_ZdaPv
	add	esp, 16
.L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1031:
	.size	_ZN6BigIntD2Ev, .-_ZN6BigIntD2Ev
	.weak	_ZN6BigIntD1Ev
	.set	_ZN6BigIntD1Ev,_ZN6BigIntD2Ev
	.section	.text._ZN6BigInt10fromStringEPKc,"axG",@progbits,_ZN6BigInt10fromStringEPKc,comdat
	.align 2
	.weak	_ZN6BigInt10fromStringEPKc
	.type	_ZN6BigInt10fromStringEPKc, @function
_ZN6BigInt10fromStringEPKc:
.LFB1034:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	sub	esp, 12
	push	DWORD PTR [ebp+16]
	call	strlen
	add	esp, 16
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, 532676608
	ja	.L13
	sal	eax, 2
	jmp	.L14
.L13:
	mov	eax, -1
.L14:
	sub	esp, 12
	push	eax
	call	_Znaj
	add	esp, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [ebp-16], 0
	jmp	.L15
.L16:
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, DWORD PTR [ebp-16]
	sal	edx, 2
	add	eax, edx
	mov	ecx, DWORD PTR [ebp-16]
	mov	edx, DWORD PTR [ebp+16]
	add	edx, ecx
	movzx	edx, BYTE PTR [edx]
	movsx	edx, dl
	sub	edx, 48
	mov	DWORD PTR [eax], edx
	add	DWORD PTR [ebp-16], 1
.L15:
	mov	eax, DWORD PTR [ebp-16]
	cmp	eax, DWORD PTR [ebp-12]
	jl	.L16
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	call	_ZN6BigIntC1ERKS_
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1034:
	.size	_ZN6BigInt10fromStringEPKc, .-_ZN6BigInt10fromStringEPKc
	.text
	.align 2
	.globl	_ZNK6BigInt5dodajEi
	.type	_ZNK6BigInt5dodajEi, @function
_ZNK6BigInt5dodajEi:
.LFB1035:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	call	_ZN6BigIntC1ERKS_
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1035:
	.size	_ZNK6BigInt5dodajEi, .-_ZNK6BigInt5dodajEi
	.align 2
	.globl	_ZNK6BigInt6pomnozEi
	.type	_ZNK6BigInt6pomnozEi, @function
_ZNK6BigInt6pomnozEi:
.LFB1036:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	call	_ZN6BigIntC1ERKS_
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1036:
	.size	_ZNK6BigInt6pomnozEi, .-_ZNK6BigInt6pomnozEi
	.align 2
	.globl	_ZNK6BigInt14podzielZResztaEi
	.type	_ZNK6BigInt14podzielZResztaEi, @function
_ZNK6BigInt14podzielZResztaEi:
.LFB1037:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	sub	esp, 8
	push	DWORD PTR [ebp+12]
	push	DWORD PTR [ebp+8]
	call	_ZN6BigIntC1ERKS_
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1037:
	.size	_ZNK6BigInt14podzielZResztaEi, .-_ZNK6BigInt14podzielZResztaEi
	.globl	_ZlsRSoRK6BigInt
	.type	_ZlsRSoRK6BigInt, @function
_ZlsRSoRK6BigInt:
.LFB1038:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	mov	DWORD PTR [ebp-12], 0
	jmp	.L25
.L26:
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, DWORD PTR [ebp-12]
	sal	edx, 2
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	add	eax, 48
	movsx	eax, al
	sub	esp, 8
	push	eax
	push	DWORD PTR [ebp+8]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	add	esp, 16
	add	DWORD PTR [ebp-12], 1
.L25:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax]
	cmp	edx, eax
	jb	.L26
	sub	esp, 8
	push	10
	push	DWORD PTR [ebp+8]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	add	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1038:
	.size	_ZlsRSoRK6BigInt, .-_ZlsRSoRK6BigInt
	.globl	_ZplRK6BigIntS1_
	.type	_ZplRK6BigIntS1_, @function
_ZplRK6BigIntS1_:
.LFB1039:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1039
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 68
	.cfi_offset 3, -12
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-60], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-64], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-68], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	eax, DWORD PTR [ebp-64]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [ebp-36], eax
	mov	eax, DWORD PTR [ebp-68]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [ebp-32], eax
	mov	eax, DWORD PTR [ebp-36]
	cmp	eax, DWORD PTR [ebp-32]
	jle	.L29
	mov	eax, DWORD PTR [ebp-36]
	jmp	.L30
.L29:
	mov	eax, DWORD PTR [ebp-32]
.L30:
	mov	DWORD PTR [ebp-56], eax
	mov	eax, DWORD PTR [ebp-64]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR [ebp-68]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [ebp-24], eax
	mov	eax, DWORD PTR [ebp-56]
	add	eax, eax
	cmp	eax, 532676608
	ja	.L31
	sal	eax, 2
	jmp	.L32
.L31:
	mov	eax, -1
.L32:
	sub	esp, 12
	push	eax
.LEHB0:
	call	_Znaj
	add	esp, 16
	mov	DWORD PTR [ebp-20], eax
	mov	DWORD PTR [ebp-52], 0
	mov	DWORD PTR [ebp-48], 0
	jmp	.L33
.L38:
	mov	eax, DWORD PTR [ebp-48]
	cmp	eax, DWORD PTR [ebp-36]
	jle	.L34
	mov	DWORD PTR [ebp-44], 0
	jmp	.L35
.L34:
	mov	eax, DWORD PTR [ebp-48]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-28]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [ebp-44], eax
.L35:
	mov	eax, DWORD PTR [ebp-48]
	cmp	eax, DWORD PTR [ebp-32]
	jle	.L36
	mov	DWORD PTR [ebp-40], 0
	jmp	.L37
.L36:
	mov	eax, DWORD PTR [ebp-48]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-24]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [ebp-40], eax
.L37:
	mov	edx, DWORD PTR [ebp-52]
	mov	eax, DWORD PTR [ebp-44]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-40]
	add	eax, edx
	mov	DWORD PTR [ebp-16], eax
	mov	ecx, DWORD PTR [ebp-16]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR [ebp-52], eax
	mov	eax, DWORD PTR [ebp-48]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-20]
	lea	ebx, [edx+eax]
	mov	ecx, DWORD PTR [ebp-16]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR [ebx], edx
	add	DWORD PTR [ebp-48], 1
.L33:
	mov	eax, DWORD PTR [ebp-48]
	cmp	eax, DWORD PTR [ebp-56]
	jl	.L38
	jmp	.L39
.L40:
	mov	eax, DWORD PTR [ebp-56]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-56], edx
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp-20]
	lea	ebx, [edx+eax]
	mov	ecx, DWORD PTR [ebp-52]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR [ebx], edx
	mov	ecx, DWORD PTR [ebp-52]
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR [ebp-52], eax
.L39:
	cmp	DWORD PTR [ebp-52], 0
	jg	.L40
	mov	eax, DWORD PTR [ebp-56]
	sub	esp, 8
	push	eax
	push	DWORD PTR [ebp-60]
	call	_ZN6BigIntC1Ej
.LEHE0:
	add	esp, 16
	mov	edx, DWORD PTR [ebp-56]
	mov	eax, DWORD PTR [ebp-60]
	mov	eax, DWORD PTR [eax+4]
	sub	esp, 4
	push	edx
	push	DWORD PTR [ebp-20]
	push	eax
.LEHB1:
	.cfi_escape 0x2e,0x10
	call	_Z6kopiujPiS_j
.LEHE1:
	add	esp, 16
	cmp	DWORD PTR [ebp-20], 0
	je	.L41
	sub	esp, 12
	push	DWORD PTR [ebp-20]
	call	_ZdaPv
	add	esp, 16
.L41:
	nop
	mov	eax, DWORD PTR [ebp-60]
	mov	ebx, DWORD PTR [ebp-12]
	xor	ebx, DWORD PTR gs:20
	je	.L44
	jmp	.L46
.L45:
	mov	ebx, eax
	sub	esp, 12
	push	DWORD PTR [ebp-60]
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, ebx
	sub	esp, 12
	push	eax
.LEHB2:
	call	_Unwind_Resume
.LEHE2:
.L46:
	call	__stack_chk_fail
.L44:
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1039:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1039:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1039-.LLSDACSB1039
.LLSDACSB1039:
	.uleb128 .LEHB0-.LFB1039
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1039
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L45-.LFB1039
	.uleb128 0
	.uleb128 .LEHB2-.LFB1039
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE1039:
	.text
	.size	_ZplRK6BigIntS1_, .-_ZplRK6BigIntS1_
	.globl	_ZmiRK6BigIntS1_
	.type	_ZmiRK6BigIntS1_, @function
_ZmiRK6BigIntS1_:
.LFB1040:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1040
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 36
	.cfi_offset 3, -12
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-28], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-32], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [ebp-36], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	eax, [ebp-20]
	sub	esp, 4
	push	-1
	push	DWORD PTR [ebp-36]
	push	eax
.LEHB3:
	call	_ZNK6BigInt6pomnozEi
.LEHE3:
	add	esp, 12
	mov	eax, DWORD PTR [ebp-28]
	sub	esp, 4
	lea	edx, [ebp-20]
	push	edx
	push	DWORD PTR [ebp-32]
	push	eax
.LEHB4:
	.cfi_escape 0x2e,0x10
	call	_ZplRK6BigIntS1_
.LEHE4:
	add	esp, 12
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, DWORD PTR [ebp-28]
	mov	ecx, DWORD PTR [ebp-12]
	xor	ecx, DWORD PTR gs:20
	je	.L50
	jmp	.L52
.L51:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, ebx
	sub	esp, 12
	push	eax
.LEHB5:
	call	_Unwind_Resume
.LEHE5:
.L52:
	call	__stack_chk_fail
.L50:
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	4
	.cfi_endproc
.LFE1040:
	.section	.gcc_except_table
.LLSDA1040:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1040-.LLSDACSB1040
.LLSDACSB1040:
	.uleb128 .LEHB3-.LFB1040
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB1040
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L51-.LFB1040
	.uleb128 0
	.uleb128 .LEHB5-.LFB1040
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE1040:
	.text
	.size	_ZmiRK6BigIntS1_, .-_ZmiRK6BigIntS1_
	.section	.rodata
.LC0:
	.string	"12345"
.LC1:
	.string	"7654231"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1041:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1041
	lea	ecx, [esp+4]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 64
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	sub	esp, 8
	push	OFFSET FLAT:.LC0
	lea	eax, [ebp-68]
	push	eax
.LEHB6:
	call	_ZN6BigIntC1EPKc
.LEHE6:
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:.LC1
	lea	eax, [ebp-60]
	push	eax
.LEHB7:
	.cfi_escape 0x2e,0x10
	call	_ZN6BigIntC1EPKc
.LEHE7:
	add	esp, 16
	lea	eax, [ebp-52]
	sub	esp, 4
	lea	edx, [ebp-60]
	push	edx
	lea	edx, [ebp-68]
	push	edx
	push	eax
.LEHB8:
	call	_ZplRK6BigIntS1_
.LEHE8:
	add	esp, 12
	sub	esp, 8
	lea	eax, [ebp-52]
	push	eax
	push	OFFSET FLAT:_ZSt4cout
.LEHB9:
	call	_ZlsRSoRK6BigInt
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	push	eax
	call	_ZNSolsEPFRSoS_E
.LEHE9:
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-52]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	lea	eax, [ebp-44]
	sub	esp, 4
	lea	edx, [ebp-60]
	push	edx
	lea	edx, [ebp-68]
	push	edx
	push	eax
.LEHB10:
	call	_ZmiRK6BigIntS1_
.LEHE10:
	add	esp, 12
	sub	esp, 8
	lea	eax, [ebp-44]
	push	eax
	push	OFFSET FLAT:_ZSt4cout
.LEHB11:
	call	_ZlsRSoRK6BigInt
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	push	eax
	call	_ZNSolsEPFRSoS_E
.LEHE11:
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-44]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	lea	eax, [ebp-36]
	sub	esp, 4
	push	999
	lea	edx, [ebp-68]
	push	edx
	push	eax
.LEHB12:
	call	_ZNK6BigInt5dodajEi
.LEHE12:
	add	esp, 12
	sub	esp, 8
	lea	eax, [ebp-36]
	push	eax
	push	OFFSET FLAT:_ZSt4cout
.LEHB13:
	call	_ZlsRSoRK6BigInt
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	push	eax
	call	_ZNSolsEPFRSoS_E
.LEHE13:
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-36]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	lea	eax, [ebp-28]
	sub	esp, 4
	push	3
	lea	edx, [ebp-68]
	push	edx
	push	eax
.LEHB14:
	call	_ZNK6BigInt6pomnozEi
.LEHE14:
	add	esp, 12
	sub	esp, 8
	lea	eax, [ebp-28]
	push	eax
	push	OFFSET FLAT:_ZSt4cout
.LEHB15:
	call	_ZlsRSoRK6BigInt
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	push	eax
	call	_ZNSolsEPFRSoS_E
.LEHE15:
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-28]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	lea	eax, [ebp-20]
	sub	esp, 4
	push	3
	lea	edx, [ebp-68]
	push	edx
	push	eax
.LEHB16:
	call	_ZNK6BigInt14podzielZResztaEi
.LEHE16:
	add	esp, 12
	sub	esp, 8
	lea	eax, [ebp-20]
	push	eax
	push	OFFSET FLAT:_ZSt4cout
.LEHB17:
	call	_ZlsRSoRK6BigInt
	add	esp, 16
	sub	esp, 8
	push	OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	push	eax
	call	_ZNSolsEPFRSoS_E
.LEHE17:
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	ebx, 0
	sub	esp, 12
	lea	eax, [ebp-60]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-68]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, ebx
	mov	ecx, DWORD PTR [ebp-12]
	xor	ecx, DWORD PTR gs:20
	je	.L62
	jmp	.L70
.L65:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-52]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L56
.L66:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-44]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L56
.L67:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-36]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L56
.L68:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-28]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L56
.L69:
	mov	ebx, eax
	sub	esp, 12
	lea	eax, [ebp-20]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L56
.L64:
	mov	ebx, eax
.L56:
	sub	esp, 12
	lea	eax, [ebp-60]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	jmp	.L61
.L63:
	mov	ebx, eax
.L61:
	sub	esp, 12
	lea	eax, [ebp-68]
	push	eax
	call	_ZN6BigIntD1Ev
	add	esp, 16
	mov	eax, ebx
	sub	esp, 12
	push	eax
.LEHB18:
	call	_Unwind_Resume
.LEHE18:
.L70:
	call	__stack_chk_fail
.L62:
	lea	esp, [ebp-8]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, [ecx-4]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1041:
	.section	.gcc_except_table
.LLSDA1041:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1041-.LLSDACSB1041
.LLSDACSB1041:
	.uleb128 .LEHB6-.LFB1041
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB7-.LFB1041
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L63-.LFB1041
	.uleb128 0
	.uleb128 .LEHB8-.LFB1041
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L64-.LFB1041
	.uleb128 0
	.uleb128 .LEHB9-.LFB1041
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L65-.LFB1041
	.uleb128 0
	.uleb128 .LEHB10-.LFB1041
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L64-.LFB1041
	.uleb128 0
	.uleb128 .LEHB11-.LFB1041
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L66-.LFB1041
	.uleb128 0
	.uleb128 .LEHB12-.LFB1041
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L64-.LFB1041
	.uleb128 0
	.uleb128 .LEHB13-.LFB1041
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L67-.LFB1041
	.uleb128 0
	.uleb128 .LEHB14-.LFB1041
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L64-.LFB1041
	.uleb128 0
	.uleb128 .LEHB15-.LFB1041
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L68-.LFB1041
	.uleb128 0
	.uleb128 .LEHB16-.LFB1041
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L64-.LFB1041
	.uleb128 0
	.uleb128 .LEHB17-.LFB1041
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L69-.LFB1041
	.uleb128 0
	.uleb128 .LEHB18-.LFB1041
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE1041:
	.text
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1048:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	cmp	DWORD PTR [ebp+8], 1
	jne	.L71
	cmp	DWORD PTR [ebp+12], 65535
	jne	.L71
	sub	esp, 12
	push	OFFSET FLAT:_ZStL8__ioinit
	call	_ZNSt8ios_base4InitC1Ev
	add	esp, 16
	sub	esp, 4
	push	OFFSET FLAT:__dso_handle
	push	OFFSET FLAT:_ZStL8__ioinit
	push	OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
	call	__cxa_atexit
	add	esp, 16
.L71:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1048:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I__ZNK6BigInt5dodajEi, @function
_GLOBAL__sub_I__ZNK6BigInt5dodajEi:
.LFB1049:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 8
	sub	esp, 8
	push	65535
	push	1
	call	_Z41__static_initialization_and_destruction_0ii
	add	esp, 16
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1049:
	.size	_GLOBAL__sub_I__ZNK6BigInt5dodajEi, .-_GLOBAL__sub_I__ZNK6BigInt5dodajEi
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I__ZNK6BigInt5dodajEi
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
