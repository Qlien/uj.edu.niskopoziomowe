%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_string_msg
    call print_string

    xor rcx, rcx ; RCX = 0

read_str:

    xor rax, rax
    call read_char

    cmp al, '*'
    je reverse_str ; if char == '*' then stop reading

    mov [tmp_buf + rcx], rax

    cmp rcx, 255
    jge reverse_str ; if RCX >= 255 then stop reading

    inc rcx
    jmp read_str

reverse_str:

    mov [n], rcx ; n = RCX

    mov rax, result_msg
    call print_string

reverse_loop:

    dec rcx
    push rcx

    xor rax, rax
    mov al, [tmp_buf + rcx] ; RAX = str[i]

    cmp al, 'a'
    jl just_print

    cmp al, 'z'
    jg just_print

    sub al, 'a'
    add al, 'A' ; zwiększamy znaczek

just_print:

    call print_char ; wypisujemy znaczek

    pop rcx
    cmp rcx, 0
    jg reverse_loop

    call print_nl

    xor rax, rax ; powrót do C
    leave
    ret

section .data

    enter_string_msg db "Wprowadż ciąg: ", 0
    result_msg db "Przetwarzony ciąg: ", 0
    tmp_buf resb 255
    n db 0