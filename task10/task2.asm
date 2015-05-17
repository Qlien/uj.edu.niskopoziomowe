; grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2); for i=0,1,...,N-2
; void gradientSSE(float *dst, float *src, int N)
global gradientSSE
gradientSSE:
    ; rdi   dst
    ; rsi   src
    ; rdx   n
    enter 0, 0

    mov rax, rdx ; max_i = n
    sub rax, 2 ; max_i = n - 2
    and rax, -3
    mov rcx, 0 ; i = 1

gradient_loop:

    movups xmm0, [rsi + 4 + rcx*4] ; XMM0 = data[i + 1]
    movups xmm1, [rsi - 4 + rcx*4] ; XMM1 = data[i - 1]
    subps xmm0, xmm1 ; XMM0 = XMM0 - XMM1
    mulps xmm0, xmm0 ; XMM0 = XMM0^2

    mov r8, rcx ; R8 = i
    mov r9, rcx ; R9 = i
    mov r10, rdx ; R10 = N
    add r8, r10 ; R8 = i + N
    sub r9, r10 ; R9 = i - N

    movups xmm1, [rsi + r8*4] ; XMM1 = data[i + N]
    movups xmm2, [rsi + r9*4] ; XMM2 = data[i - N]
    subps xmm1, xmm2 ; XMM1 = XMM1 - XMM2
    mulps xmm1, xmm1 ; XMM1 = XMM1^2

    addps xmm0, xmm1 ; XMM0 = XMM0 + XMM1

    sqrtps xmm0, xmm0 ; XMM0 = sqrt(XMM0)

    movups [rdi + rcx * 4], xmm0 ; dst[i] = XMM0

    ; add rcx, 4 ; i++
    inc rcx ; i++
    cmp rcx, rax ; if i < N - 2 then continue
    jl gradient_loop

    xor rax, rax

    leave
    ret