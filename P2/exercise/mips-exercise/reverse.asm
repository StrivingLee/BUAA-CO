.data
	buffer: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	msg1: .asciiz "String: "
	msg2: .asciiz "\nReversed: "
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $a1, 40
	la $a0, buffer
	li $v0, 8
	syscall
	xor $t0, $t0, $t0
	cnt_loop:
	lb $t1, buffer($t0)
	addu $t0, $t0, 1
	bnez $t1, cnt_loop
	div $t1, $t0, 2
	subu $t0, $t0, 2
	xor $t2, $t2, $t2
	xor $t3, $t3, $t3
	xor $t4, $t4, $t4
	loop1:
	addu $t2, $t4, 0
	subu $t3, $t0, $t4
	lb $t5, buffer($t2)
	lb $t6, buffer($t3)
	sb $t5, buffer($t3)
	sb $t6, buffer($t2)
	addu $t4, $t4, 1
	bne $t4, $t1, loop1
	la $a0, msg2
	li $v0, 4
	syscall
	la $a0, buffer
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	
	