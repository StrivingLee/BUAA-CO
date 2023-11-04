.data
	msg1: .asciiz "Please input number: "
	msg2: .asciiz "\nYes\n"
	msg3: .asciiz "\nNo\n"
.globl main
.text
	main:
	move $fp, $sp
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	xor $t0, $t0, $t0
	loop:
	beqz $t1, fin
	div $t1, $t1, 10
	mfhi $t2
	subu $sp, $sp, 4
	sw $t2, ($sp)
	addu $t0, $t0, 1
	b loop
	fin:
	div $t0, $t0, 2
	xor $t1, $t1, $t1
	xor $t2, $t2, $t2
	subu $t3, $sp, 4
	loop1:
	beqz $t0, success
	addu $t4, $t3, 4
	subu $t5, $fp, 4
	lw $t4, ($t4)
	lw $t5, ($t5)
	bne $t4, $t5, failure
	subu $t0, $t0, 1
	b loop1
	failure:
	la $a0, msg3
	li $v0, 4
	syscall
	li $v0, 10
	syscall	
	success:
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	
	