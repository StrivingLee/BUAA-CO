.macro func_start
subu $sp, $sp, 8
sw $ra, 0($sp)
sw $fp, 4($sp)
addu $fp, $sp, 8
.end_macro

.macro func_end
move $sp, $fp
lw $ra, -8($fp)
lw $fp, -4($fp)
jr $ra
.end_macro

.macro proc_end
li $v0, 10
syscall
.end_macro

.data
	msg1: .asciiz "i="
	msg2: .asciiz "static_i="
	.align 2
	static_i: .word 0
.globl start main func
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	xor $s0, $s0, $s0
	loop0:
	bge $s0, 3, endl0
	jal func
	addu $s0, $s0, 1
	b loop0
	endl0:
	func_end
	
	func:
	func_start
	subu $sp, $sp, 4
	sw $zero, ($sp)
	li $v0, 4
	la $a0, msg1
	syscall
	lw $t0, ($sp)
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	addu $t0, $t0, 1
	sw $t0, ($sp)
	lw $t0, static_i
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	addu $t0, $t0, 1
	sw $t0, static_i
	func_end
	
	spin:
	j spin
