	.file	"sorting.c"
	.intel_syntax noprefix
# GNU C (Ubuntu 4.9.1-16ubuntu6) version 4.9.1 (x86_64-linux-gnu)
#	compiled by GNU C version 4.9.1, GMP version 6.0.0, MPFR version 3.1.2-p3, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu sorting.c -march=ivybridge
# -mmmx -mno-3dnow -msse -msse2 -msse3 -mssse3 -mno-sse4a -mcx16 -msahf
# -mno-movbe -mno-aes -mno-sha -mpclmul -mpopcnt -mno-abm -mno-lwp -mno-fma
# -mno-fma4 -mno-xop -mno-bmi -mno-bmi2 -mno-tbm -mavx -mno-avx2 -msse4.2
# -msse4.1 -mno-lzcnt -mno-rtm -mno-hle -mrdrnd -mf16c -mfsgsbase
# -mno-rdseed -mno-prfchw -mno-adx -mfxsr -mxsave -mxsaveopt -mno-avx512f
# -mno-avx512er -mno-avx512cd -mno-avx512pf -mno-prefetchwt1
# --param l1-cache-size=32 --param l1-cache-line-size=64
# --param l2-cache-size=6144 -mtune=ivybridge -masm=intel
# -auxbase-strip sorting.asm -O3 -fverbose-asm -fstack-protector-strong
# -Wformat -Wformat-security
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
# -fpredictive-commoning -fprefetch-loop-arrays -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
# -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fstack-protector-strong -fstrict-aliasing
# -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
# -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
# -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
# -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -funswitch-loops
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops -mavx
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store -mcx16
# -mf16c -mfancy-math-387 -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc
# -mieee-fp -mlong-double-80 -mmmx -mpclmul -mpopcnt -mpush-args -mrdrnd
# -mred-zone -msahf -msse -msse2 -msse3 -msse4 -msse4.1 -msse4.2 -mssse3
# -mtls-direct-seg-refs -mvzeroupper -mxsave -mxsaveopt

	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	sort
	.type	sort, @function
sort:
.LFB24:
	.cfi_startproc
	test	esi, esi	# n
	jle	.L7	#,
	sub	esi, 1	# D.2763,
	lea	r8, [rdi+4+rsi*4]	# D.2765,
	mov	rsi, rdi	# ivtmp.15, a
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rax, rdi	# ivtmp.9, a
	.p2align 4,,10
	.p2align 3
.L5:
	mov	edx, DWORD PTR [rsi]	# D.2761, MEM[base: _39, offset: 0B]
	mov	ecx, DWORD PTR [rax]	# D.2761, MEM[base: _31, offset: 0B]
	cmp	edx, ecx	# D.2761, D.2761
	jle	.L4	#,
	mov	DWORD PTR [rsi], ecx	# MEM[base: _39, offset: 0B], D.2761
	mov	DWORD PTR [rax], edx	# MEM[base: _31, offset: 0B], D.2761
.L4:
	add	rax, 4	# ivtmp.9,
	cmp	rax, r8	# ivtmp.9, D.2765
	jne	.L5	#,
	add	rsi, 4	# ivtmp.15,
	cmp	rsi, r8	# ivtmp.15, D.2765
	jne	.L3	#,
.L7:
	ret
	.cfi_endproc
.LFE24:
	.size	sort, .-sort
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.unlikely
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	edi, OFFSET FLAT:.LC1	#,
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xor	ebp, ebp	# i
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 64	#,
	.cfi_def_cfa_offset 96
	mov	rax, QWORD PTR fs:40	# tmp100,
	mov	QWORD PTR [rsp+56], rax	# D.2781, tmp100
	xor	eax, eax	# tmp100
	lea	rsi, [rsp+12]	# tmp102,
	mov	QWORD PTR [rsp+16], 0	# a,
	mov	QWORD PTR [rsp+24], 0	# a,
	lea	rbx, [rsp+16]	# tmp99,
	mov	QWORD PTR [rsp+32], 0	# a,
	mov	r12, rbx	# ivtmp.27, tmp99
	mov	QWORD PTR [rsp+40], 0	# a,
	mov	QWORD PTR [rsp+48], 0	# a,
	call	__isoc99_scanf	#
	mov	esi, DWORD PTR [rsp+12]	# D.2779, n
	test	esi, esi	# D.2779
	jle	.L10	#,
	.p2align 4,,10
	.p2align 3
.L11:
	mov	rsi, r12	#, ivtmp.27
	mov	edi, OFFSET FLAT:.LC1	#,
	xor	eax, eax	#
	call	__isoc99_scanf	#
	mov	esi, DWORD PTR [rsp+12]	# D.2779, n
	add	ebp, 1	# i,
	add	r12, 4	# ivtmp.27,
	cmp	esi, ebp	# D.2779, i
	jg	.L11	#,
.L10:
	mov	rdi, rbx	#, tmp99
	xor	ebp, ebp	# i
	call	sort	#
	mov	eax, DWORD PTR [rsp+12]	#, n
	test	eax, eax	#
	jle	.L14	#,
	.p2align 4,,10
	.p2align 3
.L17:
	mov	edx, DWORD PTR [rbx]	#, MEM[base: _3, offset: 0B]
	mov	esi, OFFSET FLAT:.LC2	#,
	mov	edi, 1	#,
	xor	eax, eax	#
	add	ebp, 1	# i,
	add	rbx, 4	# ivtmp.22,
	call	__printf_chk	#
	cmp	DWORD PTR [rsp+12], ebp	# n, i
	jg	.L17	#,
.L14:
	xor	eax, eax	#
	mov	rcx, QWORD PTR [rsp+56]	# tmp101, D.2781
	xor	rcx, QWORD PTR fs:40	# tmp101,
	jne	.L25	#,
	add	rsp, 64	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	call	__stack_chk_fail	#
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
