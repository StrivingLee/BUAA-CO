.data
	msg1: .asciiz "String: "
	msg2: .asciiz "\nConverted: "
	.align 2
	buffer: .space 100
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 100
	syscall
	
	la $t1, buffer
	xor $t2, $t2, $t2
	loop:
	add $t3, $t1, $t2
	lb $t3, ($t3)
	sne $t0, $t3, $zero
	beqz $t0, fin
	sge $t4, $t3, 'a'
	sle $t5, $t3, 'z'
	and $t4, $t4, $t5
	beqz $t4, cont
	subu $t3, $t3, 'a'
	addu $t3, $t3, 'A'
	addu $t5, $t1, $t2
	sb $t3, ($t5)
	cont:
	addu $t2, $t2, 1
	b loop
	fin:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 4
	la $a0, buffer
	syscall
	li $v0, 10
	syscall 
	