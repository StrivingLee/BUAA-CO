.data
	msg1: .asciiz "The permutations are:\n"
.globl main perm
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	jal perm
	li $v0, 10
	syscall
	
	perm:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addu $fp, $sp, 8
	li $t0, 1
	loop0:
	bge $t0, 5, fin0
	li $t1, 1
	loop1:
	bge $t1, 5, fin1
	li $t2, 1
	loop2:
	bge $t2, 5, fin2
	sne $t3, $t0, $t1
	sne $t4, $t1, $t2
	sne $t5, $t0, $t2
	and $t6, $t3, $t4
	and $t6, $t6, $t5
	beqz $t6, cont 
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, ','
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, ','
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	cont:
	addu $t2, $t2, 1
	b loop2
	fin2:
	addu $t1, $t1, 1
	b loop1
	fin1:
	addu $t0, $t0, 1
	b loop0
	fin0:
	return:
	lw $ra, -8($fp)
	move $sp, $fp
	lw $fp, -4($fp)
	li $v0, 0
	jr $ra
	