BITS 32

section .text

global sortuj

sortuj:
    push ebp ; tworzymy ramkę stosu na początku funkcji
    mov ebp, esp

    %idefine a [ebp + 8]
    %idefine b [ebp + 12]
    %idefine c [ebp + 16]

    ; tu zaczyna się magia

comp1:

    mov eax, a ; EAX = a
    mov eax, [eax]
    mov ebx, b ; EBX = b
    mov ebx, [ebx]
    cmp eax, ebx
    jle comp2 ; if a <= b then compare_b_and_c

    mov ecx, eax ; ECX = a
    mov eax, a
    mov [eax], ebx ; a = b
    mov eax, b
    mov [eax], ecx ; b = a

comp2:

    mov eax, b ; EAX = b
    mov eax, [eax]
    mov ebx, c ; EBX = c
    mov ebx, [ebx]
    cmp eax, ebx
    jle comp3 ; if b <= c then compare_a_and_c

    mov ecx, eax ; ECX = a
    mov eax, b
    mov [eax], ebx ; a = b
    mov eax, c
    mov [eax], ecx ; b = a

comp3:

    mov eax, a
    mov eax, [eax]
    mov ebx, b
    mov ebx, [ebx]
    cmp eax, ebx
    jle just_return

    mov ecx, eax ; ECX = a
    mov eax, a
    mov [eax], ebx ; a = b
    mov eax, b
    mov [eax], ecx ; b = a

just_return:

    leave ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
    ret