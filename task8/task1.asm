BITS 32

section .text

    global _Z6rotateji ; unsigned int rotate(unsigned int x, int n = 1)
    global _Z6rotatehi ; unsigned char rotate(unsigned char x, int n = 1)

rotate:

    enter 0, 0

    %define x dword [ebp + 8]
    %define n dword [ebp + 12]

    mov eax, n
    mov ecx, x
    rol eax, cl

; rotate_loop:

    ; shl low_word, 1
    ; rcl high_word, 1
    ; concat high_word, low_word

    ; mov ebx, eax
    ; and ebx, 0xffff0000
    ; and eax, 0x0000ffff
    ; shl eax, 1
    ; rcl ebx, 1

;     mov edx, eax ; edx = N
;     and edx, 0x1000 ; edx = high bit (CF)
;     mov ebx, 0xffff0000 ; ebx = high word mask
;     and ebx, eax ; ebx = high_word
;     shl ax, 1 ; shl low_word, 1
;     cmp edx, 0
;     jz after_high_bit
;     stc
; after_high_bit:
;     rcl ebx, 1 ; rcl high_word, 1
;     shl ebx, 16
;     and eax, 0x0000ffff ; eax = low_word
;     or ebx, eax ; ebx = concat high_word, low_word
;     mov eax, ebx ; eax = ebx

    ; loop rotate_loop

    leave
    ret

_Z6rotateji:

    enter 0, 0

    %define x dword [ebp + 8]
    %define n dword [ebp + 12]

    push x
    push n

    call rotate

    leave
    ret

_Z6rotatehi:

    enter 0, 0

    %define x dword [ebp + 8]
    %define n dword [ebp + 12]

    push x
    push n

    call rotate

    leave
    ret