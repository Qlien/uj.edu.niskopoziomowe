BITS 32

section .text

; void copy(int *dst, int *src, int n);
global _Z4copyPiS_i
_Z4copyPiS_i:

    enter 0, 0

    %define dst [ebp + 8]
    %define src [ebp + 12]
    %define n [ebp + 16]

    mov ecx, n
    mov edi, dst
    mov esi, src

copy_loop:

    lodsd
    stosd

    loop copy_loop

    leave
    ret

; void addition(int* x, int x_len, int* y, int y_len, int* &z, int* z_len);
global _Z8additionPiiS_iRS_S_
_Z8additionPiiS_iRS_S_:

    enter 0, 0

    leave
    ret

; void multiplication(int *x, int x_len, int *y, int y_len, int *&z, int *z_len);
global _Z14multiplicationPiiS_iRS_S_
_Z14multiplicationPiiS_iRS_S_:

    enter 0, 0

    leave
    ret

; void division(int *x, int x_len, int *y, int y_len, int *&z, int *z_len);
global _Z8divisionPiiS_iRS_S_
_Z8divisionPiiS_iRS_S_:

    enter 0, 0

    leave
    ret