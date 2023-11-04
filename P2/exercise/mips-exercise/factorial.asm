.data
	msg1: .asciiz "Please input number: "
	msg2: .asciiz "\nFactorial is: "
.globl main fact
.text
	main:
	la $a0, msg1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	jal fact
	move $t0, $v0
	li $v0, 4
	la $a0, msg2
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	fact:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addu $fp, $sp, 8
	subu $sp, $sp, 4
	beq $a0, 1, fin
	sw $a0, -12($fp)
	subu $a0, $a0, 1
	jal fact
	lw $a0, -12($fp)
	mulu $v0, $a0, $v0
	j ret
	fin:
	li $v0, 1
	ret:
	lw $ra, -8($fp)
	move $sp, $fp
	lw $fp, -4($fp)
	jr $ra
	
