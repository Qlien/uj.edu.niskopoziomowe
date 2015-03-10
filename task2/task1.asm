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

check_is_prime:

    mov rax, [i_max]
    mov rbx, [i]
    cmp rax, rbx ; if i == i_max then break
    je return_is_prime

    ; krok pętli
    mov rax, [num] ; RAX = num
    mov rcx, [i] ; RCX = i
    mov rdx, 0 ; RDX = 0
    div rcx ; RDX = num MOD i

    cmp rdx, 0
    je return_is_not_prime ; if RDX == 0 (if num MOD i == 0)

    mov rax, [i]
    inc rax
    mov [i], rax ; i++

    jmp check_is_prime

return_is_not_prime:

    mov rax, is_not_prime
    call print_string
    call print_nl

    jmp just_exit

return_is_prime:

    mov rax, is_prime
    call print_string
    call print_nl

just_exit:

    mov rax, 0 ; powrót do C
    leave
    ret

section .data

    enter_num_msg db "Podaj liczby: ", 0
    is_prime db "Jest liczbą pierwszą", 0
    is_not_prime db "NIE Jest liczbą pierwszą", 0
    num dq 0
    i_max dq 0
    i dq 0