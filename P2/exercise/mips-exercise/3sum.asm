.data
	msg1: .asciiz "Please input 3 numbers: "
	msg2: .asciiz "\nSum is "
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	li $v0, 5
	syscall
	move $t3, $v0
	addu $t0, $t1, $t2
	addu $t0, $t0, $t3
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall