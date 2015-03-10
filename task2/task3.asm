%include "asm64_io.inc"

section .bss

section .text

global asm_main

asm_main:

    enter 0, 0

    mov rax, enter_num1_msg
    call print_string

    call read_int   ; wczytanie liczby int
    mov [num1], rax

    mov rax, enter_num2_msg
    call print_string

    call read_int   ; wczytanie liczby int
    mov [num2], rax

    mov rax, [num1]
    mov rbx, [num2]
    cmp rax, rbx

    jl set_max_to_num2

set_max_to_num1:

    mov rax, [num1]
    mov [i], rax

set_max_to_num2:

    mov rax, [num2]
    mov [i], rax

    ; pętla od max do 1
    mov rax, 1
    mov [i_min], rax ; i_min = 1

find_gcd:

    mov rax, [i_min]
    mov rbx, [i]
    cmp rax, rbx ; if i == i_min then break
    je found_gcd

    ; krok pętli - szukamy największy wspójny dzielnik
    mov rax, [num1] ; RAX = num1
    mov rcx, [i] ; RCX = i
    mov rdx, 0 ; RDX = 0
    div rcx ; RDX = num1 MOD i

    mov [mod1], rdx ; mod1 = num1 MOD i

    mov rax, [num2] ; RAX = num2
    mov rcx, [i] ; RCX = i
    mov rdx, 0 ; RDX = 0
    div rcx ; RDX = num2 MOD i

    mov [mod2], rdx ; mod2 = num2 MOD i

    mov rax, [mod1] ; RAX = mod1
    mov rbx, [mod2] ; RBX = mod2

    cmp rax, 0
    jne next_step_gcd ; if mod1 != 0 - to ne jest NWD

    cmp rbx, 0
    jne next_step_gcd ; if mod2 != 0 - to ne jest NWD

    jmp found_gcd

next_step_gcd:
    mov rax, [i]
    dec rax
    mov [i], rax ; i--

    jmp find_gcd

found_gcd:

    mov rax, [i]
    mov [gcd], rax ; gcd = i

find_lcm:

    ; najmniejsza wspólna wielokrotność
    mov rax, [num1]
    mov rcx, [gcd]
    mov rdx, 0
    div rcx ; RAX = num1 DIV gcd

    mov rcx, [num2]
    mov rdx, 0
    mul rcx ; RAX = (num1 DIV gcd) * num2

    mov [lcm], rax

print_results:

    mov rax, result_msg
    call print_string

    mov rax, [lcm]
    call print_int

    call print_nl

    mov rax, 0 ; powrót do C
    leave
    ret

section .data

    enter_num1_msg db "Podaj pierwszej liczby: ", 0
    enter_num2_msg db "Podaj drugiej liczby: ", 0
    result_msg db "Najmniejsza wspólna wielokrotność: ", 0
    num1 dq 0
    num2 dq 0
    i dq 0
    i_min dq 0
    gcd dq 0
    lcm dq 0
    mod1 dq 0
    mod2 dq 0