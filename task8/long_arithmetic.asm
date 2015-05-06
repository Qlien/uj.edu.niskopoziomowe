BITS 32

section .text

extern malloc

; void zero(int *dst, int n);
global _Z4zeroPii
_Z4zeroPii:

    enter 0, 0

    %define dst [ebp + 8]
    %define n [ebp + 12]

    mov ecx, n
    imul ecx, 4 ; integer copy
    mov edi, dst
    mov eax, 0

    rep stosd

    leave
    ret

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

    enter 16, 0 ; 4 bytes for int* tmp, 4 bytes for int overflow, 4 - for tmp2, 4 - for tmp3

    %define p_x dword [ebp + 8]
    %define x_len dword [ebp + 12]
    %define p_y dword [ebp + 16]
    %define y_len dword [ebp + 20]
    %define p_z dword [ebp + 24]
    %define p_z_len dword [ebp + 28]
    %define overflow dword [ebp - 4]
    %define p_tmp dword [ebp - 8]
    %define p_tmp2 dword [ebp - 12]
    %define p_tmp3 dword [ebp - 16]

    ; allocate memory for result
    ; get max length for z. z_len (max) = x_len + y_len
    mov eax, p_z_len
    mov ebx, x_len
    mov [eax], ebx
    mov ebx, y_len
    add [eax], ebx

    imul eax, 4
    push eax ; bytes to allocate
    call malloc ; call malloc()
    add esp, 4 ; undo push
    mov edx, eax ; save returned address from malloc
    mov eax, p_z
    mov [eax], edx ; z = malloc(...)

    ; allocate mem for p_tmp variable to store mid-results
    ; its size is the same as result's
    push eax ; bytes to allocate
    call malloc ; call malloc()
    add esp, 4 ; undo push
    mov edx, eax ; save returned address from malloc
    mov eax, p_tmp
    mov [eax], edx ; tmp = malloc(...)

    ; TODO: allocate memory for tmp2
    ; TODO: allocate memory for tmp3
    ; TODO: zero tmp2
    ; TODO: zero tmp3

    ; loop init
    mov edi, p_tmp
    mov ecx, 0 ; i = 0

multiplication_y_digit_loop:

    mov esi, p_y ; iterating through y

    ; zero tmp var
    mov eax, p_tmp
    push eax ; dst
    mov eax, p_z_len
    mov eax, [eax]
    push eax ; len
    call _Z4zeroPii

    ; trailing zero for each operation
    mov eax, ecx
    imul eax, 4
    add edi, eax

    ; tmp[i] = y[i]
    mov eax, [esi]
    mov [edi], eax

    ; loop init
    push ecx ; save i

    mov esi, p_x ; iterating through x
    mov ecx, 0 ; t = 0
    ; lea eax, overflow ; we can not directly write into a variable
    ; mov [eax], dword 0
    mov overflow, dword 0

multiplication_x_digit_loop:

    mov eax, p_x ; EAX = x
    mov ebx, ecx
    imul ebx, 4 ; byte offset for t-th element
    add eax, ebx
    mov eax, [eax] ; EAX = x[t]

    mov ebx, [edi] ; EBX = tmp[i]
    imul eax, ebx ; EAX = x[t] * tmp[i]
    mov ebx, overflow
    add eax, ebx ; EAX = (x[t] * tmp[i]) + overflow
    mov ebx, 10
    div ebx ; EAX = EAX div 10; EDX = EAX mod 10

    mov [edi], edx ; tmp[i] = EAX mod 10
    ; mov ebx, overflow ; EBX = overflow
    ; add edx, [ebx] ; EDX = EAX div 10 + overflow
    ; lea ebx, overflow ; EBX = *overflow
    ; mov [ebx], edx ; *overflow = EDX
    add overflow, edx

    inc ecx

    mov eax, x_len
    cmp ecx, eax
    jl multiplication_x_digit_loop ; if t < x_len then continue

multiplication_next_i:

    ; continue i loop
    pop ecx ; restore i

    ; TODO: tmp3 = tmp + tmp2
    ; TODO: tmp2 = tmp3

    inc ecx

    mov eax, y_len
    cmp ecx, eax
    jl multiplication_y_digit_loop ; if i < y_len then continue

    leave
    ret

; void division(int *x, int x_len, int *y, int y_len, int *&z, int *z_len);
global _Z8divisionPiiS_iRS_S_
_Z8divisionPiiS_iRS_S_:

    enter 0, 0

    leave
    ret