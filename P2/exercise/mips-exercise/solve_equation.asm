.data
	msg1: .asciiz " + 100 = "
	msg2: .asciiz " * "
	msg3: .asciiz " + 268 = "
.globl main solve
.text
	main:
	
	jal solve
	li $v0, 10
	syscall
	
	solve:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addu $fp, $sp, 8
	subu $sp, $sp, 20
	li $t0, 1
	loop:
	bge $t0, 85, fin
	li $t1, 168
	rem $t2, $t1, $t0
	bnez  $t2, else2
	div $t1, $t1, $t0
	sgt $t2, $t0, $t1
	add $t3, $t0, $t1
	rem $t3, $t3, 2
	seq $t3, $t3, $zero
	sub $t4, $t0, $t1
	rem $t4, $t4, 2
	seq $t4, $t4, $zero
	and $t2, $t2, $t3
	and $t2, $t2, $t4
	beqz $t2, else1
	add $t3, $t0, $t1
	div $t3, $t3, 2
	sub $t4, $t0, $t1
	div $t4, $t4, 2
	move $t5, $t4
	mul $t5, $t5, $t5
	sub $t5, $t5, 100
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	else1:
	else2:
	addu $t0, $t0, 1
	b loop
	fin:
	return:
	lw $ra, -8($fp)
	move $sp, $fp
	lw $fp, -4($fp)
	li $v0, 0
	jr $ra