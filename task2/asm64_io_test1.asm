%include "asm64_io.inc"

section .bss

section .text

global _start

_start:

    enter 0,0

    ; dump_regs 1     ; pierwsze wypisanie zawartości rejestrów

    mov rax, enter_num_msg
    call print_string

    call read_int   ; wczytanie liczby int
    mov ebx, eax

    dump_regs 1 ; patrzymy na EBX

    ; call read_int   ; wczytanie drugiej liczby
    ; cmp eax, ebx
    ; dump_regs 2     ; drugie wypisanie zawartości rejestrów
    ; call print_nl

    ; add eax, ebx
    ; call println_int  ; wypisanie liczby int z rax
    ; call print_nl

    mov rax, 0 ; powrót do C
    leave
    ret

section .data

    enter_num_msg db "Podaj liczby: ", 0
    is_prime db "Jest liczbą pierwszą", 0
    is_not_prime db "NIE Jest liczbą pierwszą", 0