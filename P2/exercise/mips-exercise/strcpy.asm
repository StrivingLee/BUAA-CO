.data
	.align 2
	src: .space 1024
	msg0: .asciiz "Please input string: "
	msg1: .asciiz "\nSource string address is: "
	msg2: .asciiz "\nDestination string address is: "
	msg3: .asciiz "\nCopied string: "
	.align 2
	dest: .space 1024
.globl main strcpy
.text
	main:
	la $a0, msg0
	li $v0, 4
	syscall
	la $a0, src
	li $a1, 1024
	li $v0, 8
	syscall
	la $a0, msg1
	li $v0, 4
	syscall
	la $a0, src
	li $v0, 1
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	la $a0, dest
	li $v0, 1
	syscall
	la $a0, dest
	la $a1, src
	jal strcpy
	la $a0, msg3
	li $v0, 4
	syscall
	la $a0, dest
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	strcpy:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addu $fp, $sp, 8
	move $v0, $a0
	loop:
	lb $t0, ($a1)
	sb $t0, ($a0)
	addu $a0, $a0, 1
	addu $a1, $a1, 1
	beqz $t0, fin
	b loop
	fin:
	move $sp, $fp
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra
	
	
