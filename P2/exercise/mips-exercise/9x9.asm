.macro func_start
subu $sp, $sp, 8
sw $ra, 0($sp)
sw $fp, 4($sp)
addu $fp, $sp, 8
.end_macro
.macro func_end
move $sp, $fp
lw $ra, -8($fp)
lw $fp, -4($fp)
jr $ra
.end_macro

.data
.globl start main print
.text
	start:
	jal main
	li $v0, 10
	syscall
	
	main:
	func_start
	jal print
	func_end
	
	print:
	func_start
	li $t0, 1
	loop0:
	bge $t0, 10, fin0
	li $t1, 1
	loop1:
	bgt $t1, $t0, fin1
	mulu $t2, $t0, $t1
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, '*'
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, '='
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 11
	li $a0, '\t'
	syscall
	addu $t1, $t1, 1
	b loop1
	fin1:
	li $a0, '\n'
	li $v0, 11
	syscall
	addu $t0, $t0, 1
	b loop0
	fin0:	
	func_end
