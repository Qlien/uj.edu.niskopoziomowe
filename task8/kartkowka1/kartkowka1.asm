BITS 32

section .text

global wylicz
wylicz:

    enter 0, 0

    %define a [ebp + 8]
    %define b [ebp + 16]
    %define k [ebp + 24]

    fld qword b  ; st: b
    fild dword k ; st: k, b
    fsubp  ; st: (b - k)

    fld qword a  ; st: a (b - k)
    fld qword b  ; st: b a (b - k)
    faddp  ; st: (a + b) (b - k)

    fmulp  ; st: (a + b)*(b - k)

    leave
    ret