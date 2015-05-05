BITS 32

section .text

global sum

sum:

    enter 0, 0

    %define n dword [ebp + 8]
    %define a dword [ebp + 12]

    mov eax, 0 ; EAX = sum = 0
    mov ebx, a ; EBX = *a
    mov ecx, n ; ECX = i = n

add_loop:

    add eax, [ebx + 4 * ecx - 4] ; EAX += a[i]

    dec ecx ; ECX --
    cmp ecx, 0

    jg add_loop ; if ECX > 0 then goto add_loop

    ; EAX contains the sum here

    leave
    ret