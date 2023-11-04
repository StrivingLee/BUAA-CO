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

.data
	msg1: .asciiz "Please input 5 chars:"
	msg2: .asciiz "\nReverse:"
.globl start main palin
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
	li $a0, 5
	jal palin
	func_end
	
	
	palin:
	func_start
	bgt $a0, 1, else
	li $v0, 12
	syscall
	subu $sp, $sp, 4
	sw $v0, 0($sp)
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 11
	lw $a0, 0($sp)
	syscall
	b return
	else:
	li $v0, 12
	syscall
	subu $sp, $sp, 4
	sw $v0, 0($sp)
	subu $a0, $a0, 1
	jal palin
	li $v0, 11
	lw $a0, 0($sp)
	syscall
	return:
	func_end
	
	spin:
	j spin