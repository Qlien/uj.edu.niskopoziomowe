;KOMPILACJA:  plik źródłowy c_asm.asm
;nasm -o c_asm.obj -felf32 c_asm.asm
;gcc -m32 c_asm.obj -o c_asm

section .text

extern printf
extern scanf

global main

main:

    push dword welcome_msg
    call printf ; uruchomienie funkcji
    add esp, 1 * 4 ; posprzątanie stosu - rejestr ESP wskazuje to samo, co przed wywołaniem funkcji printf

    mov eax, n
    push dword eax
    push dword read1_fmt
    call scanf
    add esp, 2 * 4

    mov ecx, [n] ; i = n
    xor eax, eax ; sum = 0

sum_loop:

    add eax, ecx ; sum += i
    dec ecx ; i--
    cmp ecx, 0
    jg sum_loop ; if i > 0 then loop

    push dword eax
    push dword write1_fmt
    call printf
    add esp, 2 * 4

    xor eax, eax ; return 0;
    ret ; wyjście z programu

section .data

    welcome_msg dd "Wprowadż liczbę n: ", 0
    read1_fmt dd "%d", 0
    write1_fmt dd "Suma liczb od 1 do n = %d", 0
    n dd 0