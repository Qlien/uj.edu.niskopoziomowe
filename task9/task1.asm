global _Z7iloczyniPi
_Z7iloczyniPi:
    ; rdi   n
    ; rsi   src
    enter 0, 0

    mov rcx, rdi ; i = n
    dec rcx
    mov rax, dword 1

iloczyn_loop:

    mov rbx, [rsi + rcx*4] ; rbx = src[i]
    imul rax, rbx ; rax = rax * rbx

    loop iloczyn_loop

    leave
    ret