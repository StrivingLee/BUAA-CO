.macro func_start
subu $sp, $sp, 8
sw $fp, 4($sp)
sw $ra, 0($sp)
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
	j spin
	
	main:
	func_start
	jal print
	func_end
	
	print:
	func_start
	li $t0, 100
	li $t1, 1000
	loop:
	bge $t0, $t1, endloop
	rem $t2, $t0, 10
	div $t3, $t0, 10
	rem $t3, $t3, 10
	div $t4, $t0, 100
	rem $t4, $t4, 10
	mul $t5, $t2, $t2
	mul $t5, $t5, $t2
	mul $t6, $t3, $t3
	mul $t6, $t6, $t3
	mul $t7, $t4, $t4
	mul $t7, $t7, $t4
	add $t5, $t5, $t6
	add $t5, $t5, $t7
	bne $t0, $t5, else
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	else:
	cont:
	addu $t0, $t0, 1
	b loop
	endloop:
	func_end
	
	spin:
	j spin