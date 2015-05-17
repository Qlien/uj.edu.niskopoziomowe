; OUT(i,j) = (IN(2*i,2*j) + IN(2*i +1,2*j) + IN(2*i,2*j + 1) + IN(2*i + 1,2*j + 1))/4
; dst[i] = (src(2*i, 2*j) + src(2*i +1, 2*j) + src(2*i, 2*j + 1) + src(2*i + 1, 2*j + 1)) / 4
; void scaleSSE(float *dst, float *src, int n);
; A[10x10]
; A[2;3] = A[2*10+3] = A[row*Cols + col]
; A[NxN]; A[2*i; 2*j] = A[2*i * N + 2*j] = A[2*i*N + 2*j]
; A[NxN]; A[2*i + 1; 2*j] = A[(2*i + 1) * N + 2*j] = A[2*i*N + N + 2*j]
; A[NxN]; A[2*i - 1; 2*j] = A[(2*i - 1) * N + 2*j] = A[2*i*N - N + 2*j]
; A[NxN]; A[2*i; 2*j + 1] = A[2*i*N + 2*j + 1] = A[2*i*N + 2*j + 1]
; A[NxN]; A[2*i; 2*j - 1] = A[2*i*N + 2*j - 1] = A[2*i*N + 2*j - 1]
global scaleSSE
scaleSSE:
    ; rdi   dst
    ; rsi   src
    ; rdx   n
    enter 0, 0

    mov rax, rdx ; max_i = n
    mov rcx, 0 ; i = 0
    mov rbx, 0 ; j = 0

scale_loop_i:

    mov rbx, 0 ; j = 0

scale_loop_j:

    mov r8, rcx ; r8 = i
    imul r8, qword 2
    imul r8, rax ; r8 = (2*i*N)
    mov r9, rbx ; r9 = j
    imul r9, 2
    add r8, r9 ; r8 = (2*i*N) + (2*j)
    mov r9, r8
    add r9, rax ; r9 = r8 + N

    movups xmm0, [rsi + r8*4] ; XMM0 = data[2*i][2*j]
    movups xmm1, [rsi + r8*4 + 4] ; XMM1 = data[2*i][2*j + 1]
    movups xmm2, [rsi + r9*4] ; XMM2 = data[2*i + 1][2*j]
    movups xmm3, [rsi + r9*4 + 4] ; XMM3 = data[2*i + 1][2*j + 1]

    addps xmm0, xmm1 ; XMM0 = XMM0 + XMM1 + XMM2 + XMM3
    addps xmm0, xmm2 ; XMM0 = XMM0 + XMM1 + XMM2 + XMM3
    addps xmm0, xmm3 ; XMM0 = XMM0 + XMM1 + XMM2 + XMM3

    ; mov rdx, qword 4
    ; movups xmm1, rdx ; XMM1 = 4
    ; divps xmm0, xmm1 ; XMM0 = XMM0 / 4

    mov r8, rcx ; r8 = i
    imul r8, rax ; r8 = (i*N)
    add r8, rbx ; r8 = (i*N) + j

    movups [rdi + r8*4], xmm0 ; dst[i][j] = XMM0
    mov rdx, [rdi + r8*4]
    imul rdx, 4
    mov [rdi + r8*4], rdx

    inc rbx ; j++
    cmp rbx, rax
    jl scale_loop_j ; if j < N then continue

    inc rcx ; i++
    cmp rcx, rax ; if i < N then continue
    jl scale_loop_i

    xor rax, rax

    leave
    ret