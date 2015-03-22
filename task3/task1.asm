%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_n_msg
    call print_string

    call read_int
    mov [n], rax

    mov rcx, [n] ; RCX = n

    mov rax, enter_array_msg
    call print_string

read_array:

    push rcx

    mov rax, 0
    call read_int

    mov rbx, rax ; RBX = <wczytana liczba>
    mov [tmp_buf + 8*rcx], rbx ; tmp_buf[i] = <wczytana liczba>

    pop rcx
    loop read_array

    mov rax, 0 ; sum = 0
    mov [sum], rax
    mov rcx, [n] ; RCX = n

sum_array:

    mov rbx, [tmp_buf + 8*rcx] ; RAX = tmp_buf[i]
    mov rax, [sum]
    add rax, rbx ; RAX = sum + tmp_buf[i]
    mov [sum], rax

    loop sum_array

    mov rax, sum_msg
    call print_string

    mov rax, [sum]
    call print_int

    call print_nl

    xor rax, rax ; powrót do C
    leave
    ret

section .data

    enter_n_msg db "Wprowadż ilość liczb: ", 0
    enter_array_msg db "Wprowadż tablicę: ", 0
    sum_msg db "Suma tablicy: ", 0
    n db 0
    sum dq 0
    sys_brk equ 45
    tmp_buf resq 10