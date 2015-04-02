%include "asm64_io.inc"

; BITS 32

section .bss

section .data

	enter_items_num_msg db "Wprowadż długość tablicy: ", 0
	enter_items_msg db "Wprowadż elementy tablicy: ", 0
	prev_addr dw 0
	tmp dq 0
	first_elt times 10 dd 0

section .text

global asm_main

read_items_count:

	pop rsi
	; pop rax
	; mov [prev_addr], rax

	mov rax, enter_items_num_msg
	call print_string

	mov rax, 0
	call read_int

	push rax ; store items_count

	jmp rsi
	; mov rax, [prev_addr]
	; jmp rax

read_items:

	pop rsi
	; pop rax
	; mov [prev_addr], rax

	mov rax, enter_items_msg
	call print_string

	pop rcx
	push rcx
	mov rbx, 0

read_items_loop:

	xor rax, rax
	call read_int

	mov [first_elt + rbx * 8], rax

	inc bl
	cmp bl, cl
	jl read_items_loop

	push first_elt ; store first_item_addr

	jmp rsi
	; mov rax, [prev_addr]
	; jmp rax

sort:

	pop rsi

	pop rax ; first_item_addr
	pop rcx ; items_count

	push rbp
	mov rbp, rsp

	; xor edx, edx
	sub rsp, 40 ; a[i], a[t], i, t, tmp

	mov rbx, first_elt ; rbx = &a[first]
	lea rax, [rbx + rcx * 8] ; rax = &a[last]

	mov [rbp + 0 * 8], rbx ; store &a[first] == &a[i]
	mov [rbp + 1 * 8], rbx ; store &a[first] == &a[t]
	mov [rbp + 2 * 8], rax ; store &a[last]
	mov [rbp + 3 * 8], rbx ; store &a[first]
	mov [rbp + 4 * 8], word 0 ; tmp = 0
	mov [rbp + 5 * 8], word 0 ; tmp2 = 0

sort_loop1:

	mov rax, [rbp + 0 * 8] ; rax = &a[i]
	mov rbx, [rbp + 3 * 8] ; &a[t] = &a[first]
	mov [rbp + 1 * 8], rbx

sort_loop2:

	mov rbx, [rbp + 1 * 8] ; rbx = &a[t]
	mov rbx, [rbx] ; rbx = a[t]

	mov rcx, [rax]

	cmp rcx, rbx
	jge next_loop2 ; ----------------------- SET SORTING ORDER HERE BY CHANGING jge TO jle

	mov rbx, [rbp + 1 * 8]

	; if a[i] > a[t] then swap those two
	; RAX = &a[t]
	; RBX = &a[i]
	; RCX = a[t]
	mov rdx, [rbx] ; RDX = a[i]
	mov [rbx], rcx ; a[i] = a[t]
	mov [rax], rdx ; a[t] = RDX

	xor rdx, rdx ; clear RDX

next_loop2:

	mov rbx, [rbp + 2 * 8] ; rax = &a[last]
	mov rcx, [rbp + 1 * 8] ; rcx = &a[t]

	add rcx, 8 ; rcx++
	mov [rbp + 1 * 8], rcx ; &a[t] ++

	cmp rcx, rbx ; if &a[t] < &a[last]
	jl sort_loop2

next_loop1:

	mov rbx, [rbp + 2 * 8] ; rax = &a[last]
	mov rcx, [rbp + 0 * 8] ; rcx = &a[i]

	add rcx, 8 ; rcx++
	mov [rbp + 0 * 8], rcx ; &a[i] ++

	cmp rcx, rbx
	jl sort_loop1 ; if &a[i] < &a[last]

	; return from sorting
	add rsp, 40


	mov rax, [rbp + 2 * 8] ; store &a[last]
	mov rbx, [rbp + 3 * 8] ; store &a[first]

	push rax
	push rbx

	jmp rsi

print_items:

	pop rsi
	; pop rax
	; mov [prev_addr], rax

	pop rcx ; first_item_addr
	pop rbx ; last_item_addr

print_items_loop:

	mov rax, qword [rcx]
	call println_int

	add rcx, 8 ; move 8 bytes forward
	cmp rcx, rbx
	jl print_items_loop

	push rsi
	ret
	; mov rax, [prev_addr]
	; jmp rax

convert_to_print:

	pop rsi

	pop rcx ; first_elt
	pop rbx ; count

	lea rax, [first_elt + rbx * 8]

	push rax ; last_elt
	push rcx ; first_elt

	jmp rsi

asm_main:

	enter 0, 0

	call read_items_count
	call read_items
	call sort
	; call convert_to_print
	call print_items

	xor rax, rax
	leave

	ret