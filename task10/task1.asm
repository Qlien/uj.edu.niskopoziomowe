;void diff(int n, float *src, float *dst);
global diff
diff:
; rdi   n
; rsi   src
; rdx   dst
   enter 0, 0

   mov rax, rdi ; RAX = n
   ; mov r9, rdi
   ; mov rdi, rcx
   mov rdi, rdx ; RDI = dst

   and rax, -3
   mov rcx, 1 ; i = 1

kopiowanie:

   movups xmm0, [rsi+rcx*4] ; XMM0 = src[i]
   movups xmm1, [rsi-4+rcx*4] ; XMM1 = src[i - 1]
   ; mulps xmm0, xmm1
   ; addps xmm0, xmm1
   subps xmm0, xmm1 ; XMM0 = XMM0 - XMM1
   movups [rdi-4+rcx*4], xmm0 ; dst[i - 1] = XMM0

   add rcx, 4 ; i++
   cmp rcx, rax ; if i < RAX then continue
   jl kopiowanie

; kopiowanie_koncowki:

;    cmp rcx, r9
;    jae koniec

;    movss xmm0, [rsi+rcx*4]
;    movss xmm1, [rdx+rcx*4]
;    mulss xmm0, xmm1
;    movss [rdi+rcx*4], xmm0

;    inc rcx
;    jmp kopiowanie_koncowki

koniec:
   mov rax, 0
   leave
   ret