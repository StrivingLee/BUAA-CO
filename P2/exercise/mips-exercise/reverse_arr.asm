.macro func_start
subu $sp, $sp, 8
sw $ra, 0($sp)
sw $fp, 4($sp)
addu $fp, $sp, 8
.end_macro

.macro func_end
move $sp, $fp
lw $ra, -8($fp)
lw $fp, -4($sp)
jr $ra
.end_macro

.macro proc_end
li $v0, 10
syscall
.end_macro

.data
	msg1: .asciiz "Origin array: "
	msg2: .asciiz "\nReversed: "
	arr: .word 0,1,2,3,4,5,6,7,8,9
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $v0, 4
	la $a0, msg1
	syscall
	xor $t0, $t0, $t0
	loop0:
	bge $t0, 10, endl0
	mulu $t1, $t0, 4
	la $t2, arr
	addu $t1, $t1, $t2
	lw $t1, ($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	li $t1, 10
	div $t1, $t1, 2
	li $t2, 10
	xor $t0, $t0, $t0
	loop2:
	bge $t0, $t1, endl2
	mulu $t3, $t0, 4
	subu $t4, $t2, 1
	mulu $t4, $t4, 4
	subu $t4, $t4, $t3
	lw $t5, arr($t3)
	lw $t6, arr($t4)
	sw $t5, arr($t4)
	sw $t6, arr($t3)
	cont2:
	addu $t0, $t0, 1
	b loop2
	endl2:
	li $v0, 4
	la $a0, msg2
	syscall
	xor $t0, $t0, $t0
	loop1:
	bge $t0, 10, endl1
	mulu $t1, $t0, 4
	la $t2, arr
	addu $t1, $t1, $t2
	lw $t1, ($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	cont1:
	addu $t0, $t0, 1
	b loop1
	endl1:
	
	func_end
	
	spin:
	j spin