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

.macro proc_end
li $v0, 10
syscall
.end_macro

.macro print_msg(%msg)
li $v0, 4
la $a0, %msg
syscall
.end_macro

.data
	msg1: .asciiz "Please input a number:"
.globl start main decompos
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	print_msg (msg1)
	li $v0, 5
	syscall
	move $a0, $v0
	jal decompos
	func_end
	
	decompos:
	func_start
	li $v0, 1
	syscall # $a0为传入参数
	move $t1, $a0
	li $v0, 11
	li $a0, '='
	syscall
	li $t0, 2
	loop0:
	bgt $t0, $t1, endl0
	loop1:
	rem $t2, $t1, $t0
	bnez $t2, endl1
	li $v0, 1
	move $a0, $t0
	syscall
	div $t1, $t1, $t0
	beq $t1, 1, else
	li $a0, '*'
	li $v0, 11
	syscall
	else:
	b loop1
	endl1:
	contl0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	li $v0, 11
	li $a0, '\n'
	syscall
	func_end
	
	spin:
	j spin