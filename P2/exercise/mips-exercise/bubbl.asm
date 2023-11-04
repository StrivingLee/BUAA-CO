.data
	msg1: .asciiz "Please Input 10 numbers\n"
	msg2: .asciiz "Sorted:"
	.align 2
	buffer: .space 50

.globl main	
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	xor $t0, $t0, $t0
	la $t1, buffer
	loop0:
	li $v0, 5
	syscall
	sw $v0, ($t1)
	addu $t1, $t1, 4
	addu $t0, $t0, 1
	blt $t0, 10, loop0
	la $t1, buffer
	xor $t2, $t2, $t2
	xor $t3, $t3, $t3
	xor $t0, $t0, $t0
	loop1:
	slti $t4, $t2, 9
	beqz $t4, fin1
	xor $t3, $t3, $t3
	loop2:
	slti $t5, $t3, 9
	beqz $t5, fin2
	la $t6, buffer
	sll $s0, $t3, 2
	addu $t6, $t6, $s0
	addu $t7, $t6, 4
	lw $s1, ($t6)
	lw $s2, ($t7)
	sgt $s3, $s1, $s2
	beqz $s3, else2
	sw $s2, ($t6)
	sw $s1, ($t7)
	else2:
	addu $t3, $t3, 1
	b loop2
	fin2:
	addu $t2, $t2, 1
	b loop1
	fin1:
	li $v0, 4
	la $a0, msg2
	syscall
	xor $t0, $t0, $t0
	loop3:
	slti $t4, $t0, 10
	beqz $t4, fin3
	la $t2, buffer
	sll $t1, $t0, 2
	add $t3, $t2, $t1
	lw $a0, ($t3)
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	addu $t0, $t0, 1
	b loop3
	fin3:
	li $v0, 10
	syscall
	
	
	
	
