.data
	msg1: .asciiz "input char then echo it\n"
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	loop:
	li $v0, 12
	syscall
	beq $v0, -1, fin
	move $a0, $v0
	li $v0, 11
	syscall
	b loop
	fin:
	li $v0, 10
	syscall
	
