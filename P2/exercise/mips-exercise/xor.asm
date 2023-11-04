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
	msg1: .asciiz "a ^ b(decimal) is "
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $t0, 077
	xor $t1, $t0, 3
	li $v0, 4
	la $a0 msg1
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	xor $t1, $t1, 7
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	func_end
	
	spin:
	j spin