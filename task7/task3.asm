BITS 32

section .text

    global iloczyn_skalarny

iloczyn_skalarny:

    enter 0, 0

    %define n dword[ebp + 8]
    %define p1 dword[ebp + 12]
    %define p2 dword[ebp + 16]

    mov ecx, n
    mov edx, p1
    mov ebx, p2

    fldz ; tail = 0

add_loop:

    fld tword [edx] ; st: p1, tail
    fld tword [ebx] ; st: p2, p1, tail

    fmulp st1, st0 ; st: p2 * p1, tail
    faddp st1, st0 ; st: p2 * p1 + tail

    add edx, 12
    add ebx, 12

    dec ecx

    cmp ecx, 0
    jg add_loop

just_exit:

    leave
    ret