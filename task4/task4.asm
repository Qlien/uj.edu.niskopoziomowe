%include "asm64_io.inc"

BITS 32

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    call get_int
    call convert_to_hex
    call print_hex

    xor eax, eax
    leave
    ret

    ; get_int - reads two integers
    ; Returns:
    ;   eax - first integer
    ;   ebx - second integer
get_int:
    pop esi
    mov eax, welcome_msg
    call print_string
    call read_int
    push eax
    push esi
    xor esi, esi
    ret

convert_to_hex:
    pop esi
    pop eax
    xor ecx, ecx

convert_loop:
    mov ebx, 16
    xor edx, edx ; EDX = 0
    div ebx ; EDX = EAX mod 16; EAX = EAX div 16

    cmp edx, 9
    jle skip_a2i

    sub edx, 10
    add edx, 'A'

    jmp skip_a2i2

skip_a2i:

    add edx, '0'

skip_a2i2:

    push edx

    xor edx, edx
    inc cl

    cmp eax, 0
    jg convert_loop

    ; push number_of_digits

    push ecx
    push esi
    xor esi, esi

    ret

print_hex:
    pop esi

    mov eax, res_msg
    call print_string

    ; i = n
    pop ecx

write_digit:

    pop eax
    call print_char

    dec cl

    cmp ecx, 0
    jg write_digit

    call print_nl
    xor eax, eax

    push esi

    ret

section .data

    welcome_msg db "Wprowadż liczbę: ", 0
    res_msg db "Ta licza w HEX: ", 0