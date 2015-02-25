section .text

global _start

_start:

    mov rax, 1 ; numer funkcji systemowej "zapisz do pliku", sys_write
    mov rdi, 1 ; argument funkcji - deskryptor plku, 1 == "erkan"
    mov rsi, tekst ; tekst do wypisywania
    mov rdx, dlugosc ; długość tekstu
    syscall
    mov rax, 60 ; sys_exit
    syscall

section .data

    tekst db "Hello, World!", 0ah ; 0ah == \n
    dlugosc equ $ - tekst ; makro, obliczające długość tekstu
