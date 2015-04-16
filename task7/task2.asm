;; COMPILACJA:
;;     gcc -c -m32 -o task2_c.o task2.c
;;     nasm -felf32 -g -o task2_asm.o task2.asm
;;     gcc -m32 -g -o task2 task2_c.o task2_asm.o

BITS 32

section .text

    global prostopadloscian

prostopadloscian:

    enter 0, 0

    %define a dword[ebp+8]
    %define b dword[ebp+12]
    %define c dword[ebp+16]
    %define vol_ptr dword [ebp+20] ; a*b*c
    %define surf_ptr dword [ebp+24] ; a*a*2 + b*b*2 + c*c*2

    ; %define tmp1 qword[rbp+8]
    ; %define tmp2 qword[rbp+16]
    mov eax, vol_ptr
    mov ebx, surf_ptr

    fldz ; st6
    fldz ; st5
    fldz ; st4
    fld c ; st3
    fld b ; st2
    fld a ; st1
    fldz ; st0

    ; calculate volume
    fsub st0, st0 ; st0 = 0
    fadd st1 ; st0 = a
    fmul st2 ; st0 *= b
    fmul st3 ; st0 *= c

    fst dword [eax]

    ; calculate surface

    fsub st0, st0 ; st0 = 0
    fadd st1 ; st0 = a
    fmul st2 ; st0 *= b
    fadd st4, st0 ; st4 = a*b

    fsub st0, st0 ; st0 = 0
    fadd st1 ; st0 = a
    fmul st3 ; st0 *= c
    fadd st5, st0 ; st5 = a*c

    fsub st0, st0 ; st0 = 0
    fadd st2 ; st0 = b
    fmul st3
    fadd st6, st0 ; st6 = b*c

    fsub st0, st0 ; st0 = 0
    fadd st4
    fadd st5
    fadd st6 ; st0 = a*b + a*c + b*c
    fadd st0 ; st0 = 2*(a*b + a*c + b*c)

    fst dword [ebx]

    ; free float stack
    fstp a
    fstp a
    fstp a
    fstp a
    fstp a
    fstp a
    fstp a

    leave

    ret
