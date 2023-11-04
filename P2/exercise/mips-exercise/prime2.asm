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

.globl start main prime
.text
	start:
	jal main
	li $v0, 10
	syscall
	j spin
	
	main:
	func_start
	jal prime
	func_end
	
	prime:
	func_start
	xor $t3, $t3, $t3
	li $t1, 101
	loop0:
	sle $t0, $t1, 200
	beqz $t0, endloop0
	li $t2, 2
	loop1:
	slt $t0, $t2, $t1
	beqz $t0, endloop1
	rem $t0, $t1, $t2
	beqz $t0, endloop1
	addu $t2, $t2, 1
	b loop1
	endloop1:
	sge $t0, $t2, $t1
	beqz $t0, else0
	addu $t3, $t3, 1
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	rem $t0, $t3, 5
	bnez $t0, else1
	li $v0, 11
	li $a0, '\n'
	syscall
	else1:
	else0:
	addu $t1, $t1, 1
	b loop0
	endloop0:
	func_end

	
	spin:
	j spin	