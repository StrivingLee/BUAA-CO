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

.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $t0, 0
	loop0:
	bgt $t0, 3, endl0
		li $t1, 0
		loop1:
		neg $t3, $t0
		add $t3, $t3, 2
		bgt $t1, $t3, endl1
		li $v0, 11
		li $a0, ' '
		syscall
		cont1:
		addu $t1, $t1, 1
		b loop1
		endl1:
		li $t2, 0
		loop2:
		mul $t3, $t0, 2
		bgt $t2, $t3, endl2
		li $v0, 11
		li $a0, '*'
		syscall
		cont2:
		addu $t2, $t2, 1
		b loop2
		endl2:
	li $v0, 11
	li $a0, '\n'
	syscall
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	li $t0, 0
	loop3:
	bgt $t0, 2, endl3
		li $t1, 0
		loop4:
		bgt $t1, $t0, endl4
		li $v0, 11
		li $a0, ' '
		syscall
		cont4:
		addu $t1, $t1, 1
		b loop4
		endl4:
		li $t2, 0
		loop5:
		mul $t3, $t0, 2
		neg $t3, $t3
		add $t3, $t3, 4
		bgt $t2, $t3, endl5
		li $v0, 11
		li $a0, '*'
		syscall
		cont5:
		addu $t2, $t2, 1
		b loop5
		endl5:
	li $v0, 11
	li $a0, '\n'
	syscall
	cont3:
	addu $t0, $t0, 1
	b loop3
	endl3:
	func_end
	
	spin:
	j spin