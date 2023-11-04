.data
	msg1: .asciiz "Convert decimal to binary\n"
	msg2: .asciiz "Decimal number:"
	msg3: .asciiz "\nBinary number:"
.globl main
.text
	main:
	la $a0, msg1
	li $v0, 4
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	move $fp, $sp
	li $v0, 5
	syscall
	move $t0, $v0
	loop0:
	div $t2, $t0, 2
	mfhi $t1
	subu $sp, $sp, 4
	sw $t1, ($sp) 
	srl $t0, $t0, 1
	bnez $t2, loop0
	la $a0, msg3
	li $v0, 4
	syscall
	loop1:
	lw $a0, ($sp)
	li $v0, 1
	syscall
	addu $sp, $sp, 4
	bne $sp, $fp, loop1
	li $v0, 10
	syscall

	