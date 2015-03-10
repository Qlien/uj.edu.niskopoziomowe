; COMPILE WITH: nasm -felf64 FILE.asm -o FILE.o -g && ld FILE.o -o FILE

section .text

global _start

_start:

    ; open file
    mov rax, 2
    mov rdi, file_name
    mov rsi, 0102 ; Create + Write
    mov rdx, 02000 ; suid
    syscall

    mov [fd], rax ; FD = file descriptor

    ; write "Witaj nowy plik!"
    mov rax, 1
    mov rdi, [fd]
    mov rsi, hello_msg
    mov rdx, hello_msg_len
    syscall

    ; close file
    mov rax, 3
    mov rdi, fd
    syscall

    ; exit
    mov rax, 60 ; sys_exit
    syscall

section .data

    fd times 10 db 0
    file_name db "task3.txt", 0
    hello_msg db "Witaj nowy plik!", 0ah
    hello_msg_len equ $ - hello_msg