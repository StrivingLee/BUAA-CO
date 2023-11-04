.data
	msg1: .asciiz "Please input number: "
	msg2: .asciiz "\nReversed: "
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	xor $t0, $t0, $t0
	loop1:
	div $t1, $t1, 10
	mfhi $t2
	mul $t0, $t0, 10
	add $t0, $t0, $t2
	beqz $t1, fin1
	b loop1
	fin1:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall
		