.data
	msg1: .asciiz "Please input three numbers:\n"
	msg2: .asciiz "Sorted: "
	.align 2
	buffer: .space 32
.globl main sort
.text
	main:
	xor $t0, $t0, $t0
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	sw $v0, buffer($t0)
	la $a0, buffer($t0)
	li $v0, 5
	syscall
	addu $t0, $t0, 4
	sw $v0, buffer($t0)
	la $a1, buffer($t0)
	li $v0, 5
	syscall
	addu $t0, $t0, 4
	sw $v0, buffer($t0)
	la $a2, buffer($t0)
	jal sort
	xor $t0, $t0, $t0
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	lw $a0, buffer($t0)
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	addu $t0, $t0, 4
	li $v0, 1
	lw $a0, buffer($t0)
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	addu $t0, $t0, 4
	li $v0, 1
	lw $a0, buffer($t0)
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	
	li $v0, 10
	syscall
	
	
	sort:
	subu $sp, $sp, 8
	sw $fp, 4($sp)
	sw $ra, 0($sp)
	addu $fp, $sp, 8
	lw $s0, ($a0)
	lw $s1, ($a1)
	lw $s2, ($a2)
	ble $s0, $s1, else1
	move $t0, $s0
	move $s0, $s1
	move $s1, $t0
	else1:
	ble $s1, $s2, else2
	move $t0, $s1
	move $s1, $s2
	move $s2, $t0
	else2:
	sw $s0, ($a0)
	sw $s1, ($a1)
	sw $s2, ($a2)
	li $v0, 0
	sort_ret:
	move $sp, $fp
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra