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

    ; read number #2
    mov rax, 0 ; read from keyboard
    mov rdi, 0 ; keyboard FD
    mov rsi, num2_str ; target buffer
    mov rdx, num_len ; read length
    syscall

    ; store numbers
    mov rax, [num1_str]
    sub rax, '0' ; SUM = pierwsza cyfra pierwszej liczby
    mov [sum], rax

    mov rax, [num2_str]
    sub rax, '0' ; RBX = pierwsza cyfra drugiej liczby

    ; add numbers
    add rax, '0' ; int to chr
    add [sum], rax ; [SUM] += RAX

    ; print "Summa: "
    mov rax, 1
    mov rdi, 1
    mov rsi, sum_msg
    mov rdx, sum_msg_len
    syscall

    ; print sum
    mov rax, 1
    mov rdi, 1
    mov rsi, sum
    mov rdx, 1 ; jednocyfrowy wynik
    syscall

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

    enter_number_msg db "Wprowadż jednocyfrowej liczby:"
    enter_number_msg_len equ $ - enter_number_msg
    sum_msg db "Suma = "
    sum_msg_len equ $ - sum_msg
    num1_str times 10 db 0 ; reserve 10 bytes with zero
    num2_str times 10 db 0 ; reserve 10 bytes with zero
    num_len db 1
    sum db 0
