%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

read_str1:

    mov rax, enter_num_msg
    call print_string

    xor rcx, rcx ; RCX = 0

read_str1_loop:

    xor rax, rax
    call read_char

    cmp al, 0ah
    je read_str2 ; if char == '\n' then stop reading str1

    ; sub rax, '0' ; atoi

    mov [tmp_buf1 + rcx], rax

    cmp rcx, 5
    jge read_str2 ; if RCX >= 5 then stop reading str1

    inc rcx
    mov [str1_len], rcx ; str1_len = RCX
    jmp read_str1_loop

read_str2:

    mov rax, enter_num_msg
    call print_string

    mov rcx, 0 ; RCX = 0

read_str2_loop:

    mov rax, 0
    call read_char

    cmp al, 0ah
    je str1_to_int ; if char == '\n' then stop reading str2

    ; sub rax, '0' ; char to int

    mov [tmp_buf2 + rcx], rax

    cmp rcx, 5
    jge str1_to_int ; if RCX >= 5 then stop reading str2

    inc rcx
    mov [str2_len], rcx ; str2_len = RCX
    jmp read_str2_loop

str1_to_int:

    mov rax, 0 ; RAX = 0
    ; mov ch, [str1_len] ; RCX = str1_len
    ; dec rcx ; RCX--
    mov rcx, 0 ; i = 0
    mov rdx, 0

str1_to_int_loop:

    mov rbx, 0
    mov bl, [tmp_buf1 + rcx] ; RBX = str1[i]
    sub rbx, '0' ; RBX -= '0' // convert next digit to int

    mov rdx, 10 ; RDX = 10
    mul rdx ; RAX = RAX * RDX

    add rax, rbx ; RAX += digit
    mov [num1], rax ; num1 = RAX

    mov rdx, 0
    mov rbx, 0

    dump_regs 1

    mov rax, [str1_len]

    dump_regs 10

    jmp just_print ; TODO END

    dec rbx

    dump_regs 11

    cmp rcx, rbx
    jge str2_to_int ; if i == str1_len - 1 then stop converting str1 to int

    inc rcx ; i++
    jmp str1_to_int_loop

str2_to_int:

    xor rax, rax ; RAX = 0
    ; mov ch, [str2_len] ; RCX = str2_len
    ; dec rcx ; RCX--
    xor rcx, rcx ; i = 0

str2_to_int_loop:

    xor rbx, rbx
    mov bl, [tmp_buf2 + rcx] ; RBX = str2[i]
    sub rbx, '0' ; RBX -= '0' // convert next digit to int

    mov rdx, 10 ; RDX = 10
    mul rdx ; RAX = RAX * RDX
    add rax, rbx ; RAX += digit
    mov [num2], rax ; num1 = RAX

    dump_regs 2

    xor rbx, rbx
    mov bh, [str2_len]
    dec rbx

    dump_regs 21

    cmp rcx, rbx
    jge add_numbers ; if i == str2_len - 1 then stop converting str2 to int

    inc rcx ; i++
    jmp str2_to_int_loop

add_numbers:

    mov rax, [num1]
    mov rbx, [num2]

    dump_regs 10

    add rax, rbx ; RAX = num1 + num2

just_print:

    call print_int ; print result
    call print_nl

    xor rax, rax ; powrót do C
    leave
    ret

section .data

    enter_num_msg db "Wprowadż liczbę (najwyżej 5 cyfr): ", 0
    tmp_buf1 times 5 resb 1
    tmp_buf2 times 5 resb 1
    str1_len dq 0
    str2_len dq 0
    num1 dq 0
    num2 dq 0
