BITS 32

section .text

    global _Z6kopiujPiS_i
    global _Z5zerujPii

_Z6kopiujPiS_i:

    enter 0, 0

    cld

    mov edi, [ebp + 8] ; destination
    mov esi, [ebp + 12] ; source
    mov ecx, [ebp + 16] ; n

_Z6kopiujPiS_i_loop:

    lodsd
    stosd

    loop _Z6kopiujPiS_i_loop

    leave
    ret

_Z5zerujPii:

    enter 0, 0

    cld

    mov edi, [ebp + 8] ; destination
    mov ecx, [ebp + 16] ; n
    mov eax, 0x0 ; value

_Z5zerujPii_loop:

    stosd

    loop _Z5zerujPii_loop

    leave
    ret