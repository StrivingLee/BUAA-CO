.data
	msg1: .asciiz "Please input number: "
	msg2: .asciiz "\neven\n"
	msg3: .asciiz "\nodd\n"
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	div $t0, $t0, 2
	mfhi $t0
	beq $t0, 1, odd
	even:
	li $v0, 4
	la $a0, msg2
	syscall
	b fin
	odd:
	li $v0, 4
	la $a0, msg3
	syscall
	fin:
	li $v0, 10
	syscall
	