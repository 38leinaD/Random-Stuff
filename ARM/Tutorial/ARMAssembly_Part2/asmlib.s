@ ARM Assembler Test Library

@ int asm_sum(int a, int b)
	.align 2				@ Align to word boundary
	.arm					@ This is ARM code
	.global asm_sum			@ This makes it a real symbol
asm_sum:					@ Start of function definition
	add     r2, r0, r1		@ Add up a (r0) and b (r1) and store result in r2
	mov		r0, r2			@ Store sum (r2) in r0 which stores return-value
	mov		pc, lr			@ Set program counter to lr (was set by caller)