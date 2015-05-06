BITS 32

section .text

extern malloc

; void copy(int *dst, int *src, int n);
global _Z4copyPiS_i
_Z4copyPiS_i:

    enter 0, 0

    %define dst [ebp + 8]
    %define src [ebp + 12]
    %define n [ebp + 16]

    mov ecx, n
    imul ecx, 4 ; integer copy
    mov edi, dst
    mov esi, src

    rep movsd

    leave
    ret

; void addition(int* x, int x_len, int* y, int y_len, int* &z, int* z_len);
global _Z8additionPiiS_iRS_S_
_Z8additionPiiS_iRS_S_:

    enter 0, 0

    %define p_x [ebp + 8]
    %define x_len [ebp + 12]
    %define p_y [ebp + 16]
    %define y_len [ebp + 20]
    %define p_z [ebp + 24]
    %define p_z_len [ebp + 28]

    ; get maximum length for z
    mov eax, x_len
    mov ebx, y_len
    cmp eax, ebx
    jge addition_allocate_mem
    mov eax, ebx

addition_allocate_mem:

    inc eax ; z_len++ for possible overflow
    mov ebx, p_z_len
    mov [ebx], eax ; *z_len = elements

    imul eax, 4
    push eax ; bytes to allocate
    call malloc ; call malloc()
    add esp, 4 ; undo push
    mov edx, eax ; save returned address from malloc
    mov eax, p_z
    mov [eax], edx ; z = malloc(...)

    ; init values for addition
    ; mov edi, p_z
    ; mov edi, [edi]
    mov ecx, 0 ; i = 0

    push 0 ; addition overflow

addition_loop:

    ; sum = overflow
    pop eax

addition_check_arg1:

    ; check for out of range index
    mov edx, x_len
    cmp ecx, edx
    jge addition_check_arg2 ; if i >= x_len then skip this

    ; set first operand to x[i]
    mov ebx, ecx
    imul ebx, 4 ; byte offset to i-th element
    mov esi, p_x
    add esi, ebx ; i-th element address
    add eax, [esi] ; EAX += x[i]

addition_check_arg2:

    ; check for out of range index
    mov edx, y_len
    cmp ecx, edx
    jge addition_check_overflow ; if i >= y_len then skip this

    ; set first operand to y[i]
    mov ebx, ecx
    imul ebx, 4 ; byte offset to i-th element
    mov esi, p_y
    add esi, ebx ; i-th element address
    add eax, [esi] ; EAX += y[i]

addition_check_overflow:

    mov edx, 0 ; overflow = 0

    cmp eax, 10 ; if EAX > 10 then { overflow = EAX div 10; EAX = EAX mod 10 }
    jl addition_store_mid_result

    mov ebx, 10
    div ebx ; EAX = EAX div 10; EDX = EAX mod 10

addition_store_mid_result:

    push edx ; store overflow

    mov ebx, ecx
    imul ebx, 4 ; byte offset
    mov edi, p_z
    mov edi, [edi]
    add edi, ebx
    mov [edi], eax ; z[i] = EAX

    ; increment i
    inc ecx
    mov eax, p_z_len
    mov eax, [eax] ; EAX = *z_len

    cmp ecx, eax
    jg addition_loop_exit

    jmp addition_loop

addition_loop_exit:

    pop eax ; get overflow

overflow_store:

    cmp eax, 0
    je addition_just_exit ; if overflow == 0 then exit

    mov ebx, ecx
    imul ebx, 4 ; byte offset
    mov edi, p_z
    add edi, ebx
    mov [edi], eax ; z[i] = EAX

addition_just_exit:

    leave
    ret

; void multiplication(int *x, int x_len, int *y, int y_len, int *&z, int *z_len);
global _Z14multiplicationPiiS_iRS_S_
_Z14multiplicationPiiS_iRS_S_:

    enter 0, 0

    %define p_x [ebp + 8]
    %define x_len [ebp + 12]
    %define p_y [ebp + 16]
    %define y_len [ebp + 20]
    %define p_z [ebp + 24]
    %define p_z_len [ebp + 28]

    ; allocate memory for result
    ; get max length for z. z_len (max) = x_len + y_len
    mov eax, p_z_len
    mov [eax], x_len
    add [eax], y_len

    imul eax, 4
    push eax ; bytes to allocate
    call malloc ; call malloc()
    add esp, 4 ; undo push
    mov edx, eax ; save returned address from malloc
    mov eax, p_z
    mov [eax], edx ; z = malloc(...)

    ; TODO: rock the magic!

    leave
    ret

; void division(int *x, int x_len, int *y, int y_len, int *&z, int *z_len);
global _Z8divisionPiiS_iRS_S_
_Z8divisionPiiS_iRS_S_:

    enter 0, 0

    leave
    ret