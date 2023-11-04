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
	msg1: .asciiz "Please input score:"
	msg2: .asciiz "\nYour grade is: "
.globl start main grade
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
	jal grade
	move $t0, $v0
	print_msg (msg2)
	move $a0, $t0
	li $v0, 11
	syscall
	li $v0, 0
	func_end
	
	grade:
	func_start
	bge $a0, 90, grade_A
	bge $a0, 60, grade_B
	b grade_C
	grade_A:
	li $v0, 'A'
	b grade_ret
	grade_B:
	li $v0, 'B'
	b grade_ret
	grade_C:
	li $v0, 'C'
	b grade_ret
	grade_ret:
	func_end
	spin:
	j spin