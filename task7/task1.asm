BITS 32

section .text

	global wartosc

wartosc:

	%define a qword[ebp+8]
	%define b qword[ebp+16]
	%define c qword[ebp+24]
	%define d qword[ebp+32]
	%define x qword[ebp+40]

	enter 0, 0

	fld d ; st4
	fld c ; st3
	fld b ; st2
	fld a ; st1
	fld x ; st0

	fmul st3, st0 ; st3 = c*x
	fmul st2, st0
	fmul st2, st0 ; st2 = b*x^2
	fmul st1, st0
	fmul st1, st0
	fmul st1, st0 ; st1 = a*x^3

	fsub st0 ; stack: 0, a*x^3, b*x^2, c*x, d
	faddp st1 ; a*x^3, b*x^2, c*x, d
	faddp st1 ; a*x^3 + b*x^2, c*x, d
	faddp st1 ; a*x^3 + b*x^2 + c*x, d
	faddp st1 ; a*x^3 + b*x^2 + c*x + d

	leave

	ret
