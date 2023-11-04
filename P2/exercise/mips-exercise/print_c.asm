.data
	msg1: .asciiz " ****\n"
	msg2: .asciiz " *\n"
	msg3: .asciiz " *\n"
	msg4: .asciiz " ****\n"


.globl main print
.text
	main:
	jal print
	li $v0, 10
	syscall	
	
	print:
	subu $sp, $sp, 8
	sw $fp, 4($sp)
	sw $ra, 0($sp)
	addu $fp, $sp, 8
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 4
	la $a0, msg4
	syscall
	print_ret:
	move $sp, $fp
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	jr $ra