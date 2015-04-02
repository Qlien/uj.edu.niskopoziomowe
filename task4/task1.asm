%include "asm64_io.inc"

BITS 32

section .bss

section .data

    welcome_msg db "Wprowadż dwie liczby: ", 0
    sum_msg db "Suma tych dwóch liczb: ", 0

section .text

global asm_main

asm_main:

    enter 0, 0

    call get_ints
    call sum_ints
    call print_sum

    xor eax, eax
    leave
    ret

    ; get_int - reads two integers
    ; Returns:
    ;   eax - first integer
    ;   ebx - second integer
get_ints:
    mov eax, welcome_msg
    call print_string
    call read_int
    push eax
    call read_int
    push eax
    pop ebx
    pop eax
    ret

    ; sum_ints - sums up two integers
    ; Params:
    ;   eax - first number
    ;   ebx - second number
    ; Returns:
    ;   eax - sum
sum_ints:
    push eax
    mov eax, sum_msg
    call print_string
    pop eax
    add eax, ebx
    mov ebx, 0
    ret

print_sum:
    call print_int
    call print_nl
    mov eax, 0
    ret