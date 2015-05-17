; RDI, RSI, RDX, RCX, R8, R9
global iloczyn
iloczyn:
    ; rdi    n
    ; rsi    a[0]
    ; rdx    a[1]
    ; rcx    a[2]
    ; r8     a[3]
    ; r9     a[4]
    ; others stack
    enter 0, 0

    mov rax, 1 ; res = 1

    cmp rdi, 0
    jle just_exit

    imul rax, rsi
    dec rdi
    cmp rdi, 0
    jle just_exit

    imul rax, rdx
    dec rdi
    cmp rdi, 0
    jle just_exit

    imul rax, rcx
    dec rdi
    cmp rdi, 0
    jle just_exit

    imul rax, r8
    dec rdi
    cmp rdi, 0
    jle just_exit

    imul rax, r9
    dec rdi
    cmp rdi, 0
    jle just_exit

imul_stack_loop:

    pop rbx
    imul rax, rbx

    dec rdi
    cmp rdi, 0
    jle just_exit
    jmp imul_stack_loop

just_exit:

    leave
    ret