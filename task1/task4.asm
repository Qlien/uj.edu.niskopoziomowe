; COMPILE WITH: nasm -felf64 FILE.asm -o FILE.o -g && ld FILE.o -o FILE

section .text

global _start

_start:

    ; read systime
    mov rax, 201
    syscall

    mov [systime], rax

    ; calculate seconds (ones)
    mov rax, [systime]
    mov rcx, 10
    mov rdx, 0
    div rcx ; RAX = systime DIV 10; RDX = systime MOD 10
    mov [systime], rax ; [systime] = systime DIV 10
    mov rax, time_msg
    ; add rax, 7 ; last digit of seconds address
    add rax, 0 ; last digit of seconds address
    mov [rax], rdx ; set seconds digit
    ; add [rax], '0' ; int to char

    ; calculate seconds (tens)
    mov rax, [systime]
    mov rcx, 6
    mov rdx, 0
    div rcx ; RAX = systime DIV 6; RDX = systime MOD 6
    mov [systime], rax ; [systime] = systime DIV 6
    mov rax, time_msg
    ; add rax, 6 ; first digit of seconds address
    add rax, 1 ; first digit of seconds address
    mov [rax], rdx ; set seconds digit
    ; add [rax], '0' ; int to char

    ; calculate minutes (ones)
    mov rax, [systime]
    mov rcx, 10
    mov rdx, 0
    div rcx ; RAX = systime DIV 10; RDX = systime MOD 10
    mov [systime], rax ; [systime] = systime DIV 10
    mov rax, time_msg
    ; add rax, 4 ; last digit of minutes address
    add rax, 3 ; last digit of minutes address
    mov [rax], rdx ; set minutes digit
    ; add [rax], '0' ; int to char

    ; calculate minutes (tens)
    mov rax, [systime]
    mov rcx, 6
    mov rdx, 0
    div rcx ; RAX = systime DIV 6; RDX = systime MOD 6
    mov [systime], rax ; [systime] = systime DIV 6
    mov rax, time_msg
    ; add rax, 3 ; first digit of minutes address
    add rax, 4 ; first digit of minutes address
    mov [rax], rdx ; set minutes digit
    ; add [rax], '0' ; int to char

    ; calculate hours (ones)
    mov rax, [systime]
    mov rcx, 24
    mov rdx, 0
    div rcx ; RAX = systime DIV 24; RDX = systime MOD 24
    ; add rax, 1 ; RAX += 1 as hours starting with zero should lead to 1 more hour
    mov [systime], rdx ; [systime] = hours

    ; here in RAX we have total hours amount. First we need to split it by digits
    mov rax, [systime]
    mov rcx, 10
    mov rdx, 0
    div rcx ; RAX = [systime] DIV 10; RDX = [systime] MOD 10

    mov rbx, time_msg
    ; add rbx, 1 ; last digit of hours address
    add rbx, 6 ; last digit of hours address
    ; add rdx, 1 ; hours + 1
    mov [rbx], rdx ; set hours digit
    ; add [rax], '0' ; int to char

    mov rbx, time_msg ; first digit of hours address
    add rbx, 7
    mov [rbx], rax ; first digit of hours address
    ; add [rax], '0' ; int to char

write_time:

    ; hours
    mov rbx, time_msg
    ; add rbx, 0
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    mov rbx, time_msg
    add rbx, 1
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    ; mov rbx, time_msg
    ; add rbx, 2

    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, rbx
    ; mov rdx, 1
    ; syscall

    ; minutes

    mov rbx, time_msg
    add rbx, 3
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    mov rbx, time_msg
    add rbx, 4
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    ; mov rbx, time_msg
    ; add rbx, 5

    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, rbx
    ; mov rdx, 1
    ; syscall

    ; seconds

    mov rbx, time_msg
    add rbx, 6
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    mov rbx, time_msg
    add rbx, 7
    mov rcx, [rbx]
    add rcx, '0'
    mov [rbx], rcx

    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 1
    syscall

    ; exit
    mov rax, 60 ; sys_exit
    syscall

section .data

    systime times 32 db 0
    time_msg db "XX:XX:XX", 0ah
    time_msg_len equ $ - time_msg
