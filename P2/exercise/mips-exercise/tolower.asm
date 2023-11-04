.data
	buffer: .space 201
	msg1: .asciiz "Please input string:"
	msg2: .asciiz "\nConvertid:"
	
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 8
	la $a0, buffer
	li $a1, 200
	syscall
	xor $t0, $t0, $t0
	loop:
	lb $t1, buffer($t0)
	sge $t2, $t1, 'A'
	sle $t3, $t1, 'Z'
	and $t4, $t2, $t3
	beqz $t4, fin
	subu $t1, $t1, 'A'
	addu $t1, $t1, 'a'
	sb $t1, buffer($t0)
	fin:
	addu $t0, $t0, 1
	bnez $t1, loop
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 4
	la $a0, buffer
	syscall
	li $v0, 10
	syscall
	