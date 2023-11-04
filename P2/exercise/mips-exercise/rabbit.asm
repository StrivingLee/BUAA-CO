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

.globl start main print
.text
	start:
	jal main
	li $v0, 10
	syscall
	j spin
	
	main:
	func_start
	jal print
	func_end
	
	print:
	func_start
	li $t0, 1
	li $t1, 1
	li $t2, 1
	loop0:
	bgt $t0, 20, endloop0
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, '\t'
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 11
	li $a0, '\t'
	syscall
	rem $t3, $t0, 2
	bnez $t3, else0
	li $v0, 11
	li $a0, '\n'
	syscall
	else0: 
	addu $t1, $t1, $t2
	addu $t2, $t1, $t2
	addu $t0, $t0, 1
	b loop0
	endloop0:
	func_end
	
	spin:
	j spin
