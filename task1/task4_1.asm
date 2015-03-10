; COMPILE WITH: nasm -felf64 FILE.asm -o FILE.o -g && ld FILE.o -o FILE

section .text

global _start

_start:

    ; read systime
    mov rax, 201
    syscall

    mov [systime], rax

    ; calculate systime in seconds
    mov rax, [systime]
    mov rcx, 3600
    mov rdx, 0
    div rcx ; RAX = systime DIV 3600; RDX = systime MOD 3600
    mov [hours], rax ; [hours] = systime DIV 3600
    mov rcx, 24
    mov rdx, 0
    div rcx ; RDX = hours
    inc rdx ; hours + 1. because they start at zero

    ; exit
    mov rax, 60 ; sys_exit
    syscall

section .data

    systime times 32 db 0
    hours db 0
