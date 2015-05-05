BITS 32

section .text

    global tablicuj

tablicuj:

    enter 0, 0

    %define a qword [ebp + 8]
    %define b qword [ebp + 16]
    %define P qword [ebp + 24]
    %define Q qword [ebp + 32]
    %define xmin qword [ebp + 40]
    %define xmax qword [ebp + 48]
    %define k dword [ebp + 56]
    %define res dword [ebp + 64]

start_tabl:

    fld xmax
    fld xmin
    fsubp ; st: xmax - xmin
    fld k
    fdivp ; st: (xmax - xmin) / k

    fld xmin ; st: x, step

    fwait

    mov ecx, k

    ; y[i] = a*(sin(P*2*pi*x))^2 + b*(sin(Q*2*pi*x))^2

tabl_loop:

calc_left:
    fldpi ; st: pi, x, step
    fld1
    fld1
    faddp ; st: 2, pi, x, step
    fld P ; st: P, 2, pi, x, step
    fmulp ; st: P * 2, pi, x, step
    fmulp ; st: P * 2 * pi, x, step
    fmul st0, st1 ; st: P * 2 * pi * x, x, step
    fsin ; st: sin(P * 2 * pi * x), x, step
    fldz ; st: 0, sin(...), x, step
    fadd st0, st1 ; st: sin(...), sin(...), x, step
    fmulp ; st: sin(...) ^ 2, x, step
    fld a ; st: a, sin(...) ^ 2, x, step
    fmulp ; st: a * sin(...) ^ 2, x, step

calc_right:

    fldz ; st: 0, (left), x, step
    fadd st0, st2 ; st: x, (left), x, step
    fld1
    fld1
    faddp ; st: 2, x, (left), x, step
    fldpi ; st: pi, 2, x, (left), x, step
    fld Q ; st: Q, pi, 2, x, (left), x, step
    fmulp ; st: Q * pi, 2, x, (left), x, step
    fmulp ; st: Q * 2 * pi, x, (left), x, step
    fmulp ; st: Q * 2 * pi * x, (left), x, step
    fsin ; st: sin(Q * 2 * pi * x), (left), x, step
    fldz ; st: 0, sin(...), (left), x, step
    fadd st0, st1 ; st: sin(...), sin(...), (left), x, step
    fmulp ; st: sin(...) ^ 2, (left), x, step
    fld b ; st: b, sin(...) ^ 2, (left), x, step
    fmulp ; st: b * sin(...) ^ 2, (left), x, step

    faddp ; st: (right) + (left), x, step

store_res:

    fstp res ; res[i] = (right) + (left); st: x, step

    fwait

    mov eax, res
    add eax, 8
    mov res, eax ; i++

    fadd st0, st1 ; x += step

    fwait

    loop tabl_loop

just_exit:

    fstp a
    fstp a ; clear st

    leave
    ret