%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_num1_msg
    call print_string

    call read_int   ; wczytanie liczby początku
    mov [num1], rax

    mov rax, enter_num2_msg
    call print_string

    call read_int   ; wczytanie liczby końca
    mov [num2], rax

    ; num1 muszi być mniejszym od num2
    mov rax, [num1]
    mov rbx, [num2]
    cmp rax, rbx

    jl start_outer_loop ; if num1 < num2 - skip swap

    mov rax, [num2]
    mov rbx, [num1]
    mov [num1], rax
    mov [num2], rbx

start_outer_loop:

    ; pętla od num1 do num2
    mov rax, [num2]
    mov [n_max], rax ; i_max = num2

    mov rax, [num1]
    mov [n], rax ; n = num1

outer_iteration:

    mov rax, [n]
    mov rbx, [n_max]
    cmp rax, rbx

    jge just_exit ; if n >= n_max - break

    ; pętla od 2 do n
    mov rax, 2
    mov [i], rax ; i = 2

    mov rax, [n]
    dec rax
    mov [i_max], rax ; i_max = n - 1

check_is_prime:

    mov rax, [i]
    mov rbx, [i_max]
    cmp rax, rbx ; if i >= i_max then break

    jge return_is_prime

    ; krok pętli
    mov rax, [n] ; RAX = n
    mov rcx, [i] ; RCX = i
    mov rdx, 0 ; RDX = 0
    div rcx ; RDX = n MOD i

    cmp rdx, 0
    je return_is_not_prime ; if RDX == 0 (if n MOD i == 0)

    mov rax, [i]
    inc rax
    mov [i], rax ; i++

    jmp check_is_prime

return_is_not_prime:

    jmp next_outer_iteration

return_is_prime:

    mov rax, [n]
    call print_int

    mov rax, is_prime
    call print_string

    call print_nl

    ; jmp next_outer_iteration

next_outer_iteration:

    mov rax, [n]
    inc rax
    mov [n], rax ; n++

    jmp outer_iteration

just_exit:

    mov rax, 0 ; powrót do C
    leave
    ret

section .data

    enter_num1_msg db "Podaj liczby początku: ", 0
    enter_num2_msg db "Podaj liczby końca: ", 0
    is_prime db " jest liczbą pierwszą", 0
    num1 dq 0
    num2 dq 0
    n_max dq 0
    n dq 0
    i_max dq 0
    i dq 0