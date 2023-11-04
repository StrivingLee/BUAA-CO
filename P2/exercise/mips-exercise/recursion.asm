.data
	msg1: .asciiz "Number? "
	msg2: .asciiz "\nResult:"
.globl main
.text
	j main
	
	fib:
	subu $sp, $sp, 16
	sw $fp, 12($sp)
	addu $fp, $sp, 16
	sw $ra, 8($sp)
	xor $t0, $t0, $t0
	sw $t0, 4($sp)
	sw $t0, 0($sp)
	li $v0, 1
	ble $a0, 2, return
	sw $a0, -12($fp)
	subu $a0, $a0, 1
	jal fib
	move $t0, $v0
	sw $t0, -16($fp)
	lw $a0, -12($fp)
	subu $a0, $a0, 2
	jal fib
	lw $t0, -16($fp)
	add $v0, $v0, $t0
	return:
	lw $ra, -8($fp)
	move $sp, $fp
	lw $fp, -4($fp)
	jr $ra
	

	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, msg2
	syscall
	move $a0, $t0
	jal fib
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
