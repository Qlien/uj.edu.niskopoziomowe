%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_str_msg
    call print_string

    xor rcx, rcx ; RCX = 0

read_str_loop:
    call read_char

    cmp al, 0ah ; if \n is found then stop reading
    je end_read_str_loop

    mov [tmp_buf1 + rcx], rax

    inc rcx

    cmp rcx, 255 ; if i >= 255 then stop reading
    jge end_read_str_loop

    jmp read_str_loop

end_read_str_loop:

    mov [str1_len], rcx
    xor rcx, rcx ; i = 0

; ----------------------------------------------------------

convert_with_s2_loop:

    xor rbx, rbx
    mov bl, [tmp_buf1 + rcx] ; RBX = tmp_buf1[i]
    push rcx ; store i

    xor rcx, rcx ; t = 0

find_s1_char_loop:

    xor rax, rax
    mov al, [s1 + rcx]

    cmp rax, rbx ; if s1[t] == tmp_buf1[i]
    je found_s1_char

    mov rdx, s1_len

    inc rcx ; t++

    cmp rcx, rdx ; if t >= s1_len then quit s1 substition
    jge end_find_s1_char_loop

    jmp find_s1_char_loop

found_s1_char:

    xor rbx, rbx
    mov bl, [s2 + rcx] ; RBX = s2[t]

    pop rcx

    mov [tmp_buf1 + rcx], bl ; substitude tmp_buf1[i] with s2[t]

    push rcx

end_find_s1_char_loop:

    pop rcx ; restore i

    inc rcx ; i++

    mov rbx, [str1_len]

    cmp rcx, rbx ; if i >= str1_len then end conversion
    jge end_convert_with_s2_loop

    jmp convert_with_s2_loop

end_convert_with_s2_loop:

; ----------------------------------------------------------

just_print:

    xor rcx, rcx
    mov rbx, [str1_len]

print_str_loop:

    mov rax, [tmp_buf1 + rcx]
    call print_char ; print result

    inc rcx

    cmp rcx, rbx
    jge end_print_str_loop

    jmp print_str_loop

end_print_str_loop:

    call print_nl

    xor rax, rax ; return to C
    leave
    ret

section .data

    enter_str_msg db "Podaj ciąg znaków: "
    tmp_buf1 times 255 resb 1
    str1_len dq 0
    s1 db "abcdefghijklmnopqrstuvwxyz"
    s1_len equ $ - s1
    s2 db "zyxwvutsrqponmlkjihgfedcba"
    s2_len equ $ - s2
