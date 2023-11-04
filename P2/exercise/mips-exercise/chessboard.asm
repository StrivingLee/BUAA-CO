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
	xor $t0, $t0, $t0
	loop0:
	slti $t3, $t0, 8
	bne $t3, 1, fin0
	xor $t1, $t1, $t1
	loop1:
	slti $t3, $t1, 8
	bne $t3, 1, fin1
	addu $t3, $t0, $t1
	rem $t3, $t3, 2
	beqz $t3, else0
	li $a0, 219
	li $v0, 11
	syscall
	syscall
	b endif0
	else0:
	li $a0, ' '
	li $v0, 11
	syscall
	syscall
	endif0:
	addu $t1, $t1, 1
	b loop1
	fin1:
	li $a0, '\n'
	li $v0, 11
	syscall
	addu $t0, $t0, 1
	b loop0
	fin0:
	li $v0, 0
	func_end
	
	spin:
	j spin
