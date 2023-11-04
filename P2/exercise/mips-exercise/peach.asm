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
	msg1: .asciiz "Total:"
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $t1, 9
	li $t2, 0
	li $t3, 1
	loop:
	blez $t1, endl
	addu $t4, $t3, 1
	mulu $t2, $t4, 2
	move $t3, $t2
	subu $t1, $t1, 1
	b loop
	endl:
	print_msg (msg1)
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	func_end
	
	spin:
	j spin