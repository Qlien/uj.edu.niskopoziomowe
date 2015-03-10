%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_num_msg
    call print_string

    call read_int   ; wczytanie liczby int
    mov [num], rax

    ; pętla od 2 do num - 1
    dec rax
    mov [i_max], rax ; i_max = num - 1

    mov rax, 2
    mov [i], rax ; i = 2

    mov rax, divisors_str
    call print_string

find_divisors:

    mov rax, [i_max]
    mov rbx, [i]
    cmp rax, rbx ; if i == i_max then break
    je just_exit

    ; krok pętli
    mov rax, [num] ; RAX = num
    mov rcx, [i] ; RCX = i
    mov rdx, 0 ; RDX = 0
    div rcx ; RDX = num MOD i

    cmp rdx, 0
    jne next_step ; if RDX == 0 (if num MOD i == 0)

    mov rax, [i]
    call print_int

    mov rax, separator_str
    call print_string

next_step:
    mov rax, [i]
    inc rax
    mov [i], rax ; i++

    jmp find_divisors

just_exit:

    call print_nl

    mov rax, 0 ; powrót do C
    leave
    ret

section .data

    enter_num_msg db "Podaj liczby: ", 0
    divisors_str db "Dzielniki liczby: ", 0
    separator_str db " ", 0
    num dq 0
    i_max dq 0
    i dq 0