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

.data

.globl start main age
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $a0, 5
	jal age
	move $a0, $v0
	li $v0, 1
	syscall
	func_end
	
	age:
	func_start
	bne $a0, 1, else
	li $t0, 10
	b return
	else:
	subu $a0, $a0, 1
	jal age
	move $t0, $v0
	addu $t0, $t0, 2
	return:
	move $v0, $t0
	func_end
	
	spin:
	j spin