section .text

global _start

_start:

    ; print "Wprowadż jednocyfrowej liczby:"
    mov rax, 1
    mov rdi, 1
    mov rsi, enter_number_msg
    mov rdx, enter_number_msg_len
    syscall

    ; read number #1
    mov rax, 0 ; read from keyboard
    mov rdi, 0 ; keyboard FD
    mov rsi, num1_str ; target buffer
    mov rdx, num_len ; read length
    syscall

    ; print "Wprowadż jednocyfrowej liczby:"
    mov rax, 1
    mov rdi, 1
    mov rsi, enter_number_msg
    mov rdx, enter_number_msg_len
    syscall

    ; mov [num1_str_len], rax ; save read characters amount

    ; read number #2
    mov rax, 0 ; read from keyboard
    mov rdi, 0 ; keyboard FD
    mov rsi, num2_str ; target buffer
    mov rdx, num_len ; read length
    syscall

    mov rax, num1_str
    sub rax, '0' ; RAX = pierwsza cyfra pierwszej liczby

    mov rbx, num2_str
    sub rbx, '0' ; RBX = pierwsza cyfra drugiej liczby

    add rbx ; RAX = RAX + RBX

    

;     ; print name
;     mov rax, 1
;     mov rdi, 1
;     mov rsi, name
;     mov rdx, [name_len] ; copy value from RBX
;     syscall

    ; mov [num2_str_len], rax ; save read characters amount

    ; !!!! LICZBY JEDNOCYFROWE !!!!

    ; convert numbers' string values to numeric values
    ; subtracting '0' from each char
;     mov rax, num1_str ; save num1_str address to RAX
;     add rax, num1_str_len ; move RAX to its end
;     mov rcx, 0 ; RCX = 0

; char_to_int:
;     mov rbx, [rax] ; RBX = value at RAX
;     sub rbx, '0' ; RBX -= '0'
;     mul rcx, 10 ; RCX *= 10
;     add rcx, rbx ; RCX += RBX
;     mov rbx, [rax] ; value of RAX = RBX
;     cmp rax, num1_str ; if RAX == num1_str then ZF == 1
;     jnz char_to_int ; if ZF == 1 then goto char_to_int

;     ; convert num2_str to int
;     mov rax, num2_str ; save num2_str address to RAX
;     add rax, num2_str_len ; move RAX to its end
;     mov rcx, 0 ; RCX = 0
;     jmp char_to_int

;     ; print "Hello, "
;     mov rax, 1
;     mov rdi, 1
;     mov rsi, hello_msg
;     mov rdx, hello_len
;     syscall

;     ; print name
;     mov rax, 1
;     mov rdi, 1
;     mov rsi, name
;     mov rdx, [name_len] ; copy value from RBX
;     syscall

    ; print \n
    mov rax, 1
    mov rdi, 1
    mov rsi, 0ah
    mov rdx, 1
    syscall

    ; exit
    mov rax, 60 ; sys_exit
    syscall

section .data

    welcome_msg db "What is your name?", 0ah
    welcome_len equ $ - welcome_msg
    hello_msg db "Hello, "
    hello_len equ $ - hello_msg
    name_len dq 0
    name times 64 db 0 ; reserve 64 bytes with zero
    ; name resb 64 ; reserve 64 bytes with non-zeroes
