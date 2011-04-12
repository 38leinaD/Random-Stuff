@ ARM Assembler Test Library

@ int asm_sum(int a, int b)
	.align 2				@ Align to word boundary
	.arm					@ This is ARM code
	.global asm_sum			@ This makes it a real symbol
asm_sum:					@ Start of function definition
	add     r2, r0, r1		@ Add up a (r0) and b (r1) and store result in r2
	mov		r0, r2			@ Store sum (r2) in r0 which stores return-value
	mov		pc, lr			@ Set program counter to lr (was set by caller)
	
@ int asm_mul(int a, int b)
	.align 2
	.arm
	.global asm_mul
asm_mul:
	stmfd   sp!, {r4-r11}   @ in case we needed to work with more than registers r0-r3,
                            @ we have to save the first on the stack (only r0-r3 and r12 are scratch registers)
                            @ Here, actually don't need them...
	
	mov     r3, #0          @ Initialize register holding result of multiplication
	
	movs    r2, r0          @ Move "a" into r2 and set status-flags (mov"s")
	beq     asm_mul_return  @ Immediately return if a==0

	movs    r2, r1          @ Move "b" into r2 and set status-flags (mov"s")
	beq     asm_mul_return  @ Immediately return if b==0

asm_mul_loop:	
	add     r3, r3, r0      @ r3 = r3 + r0
	subs    r1, r1, #1      @ r1 = r1 - 1 (decrement)
	bne     asm_mul_loop    @ If the zero-flag is not set (r1 > 0), loop once more
	
asm_mul_return:
	ldmfd   sp!, {r4-r11}   @ Restore the registers
	mov     r0, r3          @ Store result in r0 (return register)
	mov     pc, lr