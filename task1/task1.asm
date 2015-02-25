section .text

global _start

_start:

	; print "what's your name?"
	mov rax, 1
	mov rdi, 1
	mov rsi, welcome_msg
	mov rdx, welcome_len
	syscall

	; read name
	mov rax, 0 ; read from keyboard
	mov rdi, 0 ; keyboard FD
	mov rsi, name ; target buffer
	mov rdx, name_len ; read length
	syscall

	mov [name_len], rax ; save read characters amount

	; print "Hello, "
	mov rax, 1
	mov rdi, 1
	mov rsi, hello_msg
	mov rdx, hello_len
	syscall

	; print name
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, [name_len] ; copy value from RBX
	syscall

	; print \n
	mov rax, 1
	mov rdi, 1
	mov rsi, 0ah
	mov rdx, 1
	syscall

	; exit
	mov rax, 60 ; sys_exit
	syscall

section .data

	welcome_msg db "What is your name?", 0ah
	welcome_len equ $ - welcome_msg
	hello_msg db "Hello, "
	hello_len equ $ - hello_msg
	name_len dq 0
	name times 64 db 0 ; reserve 64 bytes with zero
	; name resb 64 ; reserve 64 bytes with non-zeroes
