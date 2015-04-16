BITS 32

section .text

global minmax

minmax:

    push ebp
    mov ebp, esp

    %define n dword [ebp + 12]

    ; tu zaczyna się magia

find_min:

    mov ecx, n ; i = n

    mov eax, [ebp + 12 + ecx * 4] ; eax = argv[n - 1] -> min

find_min_loop:

    dec ecx ; i --

    cmp ecx, 0
    jle find_max ; if i < 0 then break

    mov ebx, [ebp + 12 + ecx * 4] ; ebx = a[i]

    cmp ebx, eax
    jge find_min_loop ; if a[i] >= min then continue

    mov eax, ebx ; else min = a[i]
    mov [min], eax ; store min

    jmp find_min_loop

find_max:

    mov ecx, n ; i = n

    mov eax, [ebp + 12 + ecx * 4] ; eax = argv[n - 1] -> min

find_max_loop:

    dec ecx ; i --

    cmp ecx, 0
    jle just_return ; if i < 0 then break

    mov ebx, [ebp + 12 + ecx * 4] ; ebx = a[i]

    cmp ebx, eax
    jle find_max_loop ; if a[i] <= max then continue

    mov eax, ebx ; else max = a[i]
    mov [max], eax ; store max

    jmp find_max_loop

just_return:

    mov eax, max
    mov edx, min

    leave ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
    ret

section .data

    min dd 0
    max dd 0