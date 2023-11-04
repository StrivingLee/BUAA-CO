.data
	msg1: .asciiz "First num:"
	msg2: .asciiz "\nSecond num:"
	msg3: .asciiz "\nResult:"
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	mul $t0, $t1, $t2
	mfhi $t3
	li $v0, 4
	la $a0, msg3
	syscall
	beqz $t3 jmp1
	li $v0, 1
	move $a0, $t3
	syscall
	jmp1:
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall
	
