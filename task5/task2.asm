BITS 32

section .text

global suma

suma:
    push ebp ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
    mov ebp, esp

    ; po wykonaniu push ebp i mov ebp, esp:
    ; w [ebp]    znajduje się stary EBP
    ; w [ebp+4]  znajduje się adres powrotny z procedury
    ; w [ebp+8]  znajduje się pierwszy parametr,
    ; w [ebp+12] znajduje się drugi parametr
    ; itd.

    %idefine n [ebp + 8] ; ilość elementów tablicy
    %idefine a [ebp + 12] ; adres

    ; tu zaczyna się magia

    mov eax, n
    mov ebx, 4
    mul ebx ; EAX *= 4; 4 bajty na jeden element
    xor edx, edx
    add eax, a ; koniec tablicy
    mov ebx, eax ; EBX = koniec
    mov ecx, a ; ECX = początek

    xor eax, eax ; EAX = 0 - suma

summing_loop:

    xor edx, edx
    add eax, [ecx] ; sum += a[i]

    xor edx, edx
    add ecx, 4 ; i++
    cmp ecx, ebx
    jl summing_loop ; if ECX < EBX then loop

    leave ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
    ret