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
	msg1: .asciiz "Please input 10 numbers:\n"
	msg2: .asciiz "\nResult: "
.globl start main sort
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	subu $sp, $sp, 40
	xor $t0, $t0, $t0
	la $a0, msg1
	li $v0, 4
	syscall
	loop0:
	bge $t0, 10, endl0
	li $v0, 5
	syscall
	move $t1, $v0
	mulu $t2, $t0, 4
	addu $t2, $t2, $sp
	sw $t1, ($t2)
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	move $a0, $sp
	li $a1, 10
	jal sort
	xor $t0, $t0, $t0
	li $v0, 4
	la $a0, msg2
	syscall
	loop1:
	bge $t0, 10, endl1
	mulu $t1, $t0, 4
	addu $t1, $t1, $sp
	lw $a0, ($t1)
	li $v0, 1
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	cont1:
	addu $t0, $t0, 1
	b loop1
	endl1:
	func_end
	
	
	sort:
	func_start
	xor $t0, $t0, $t0
	subu $t1, $a1, 1
	loop2:
	bge $t0, $t1, endl2
		move $t2, $t0
		addu $t3, $t0, 1
		loop3:
		bge $t3, $a1, endl3
		mulu $t4, $t3, 4
		addu $t5, $a0, $t4
		lw $t5, ($t5)
		mulu $t6, $t2, 4
		addu $t6, $t6, $a0
		lw $t6, ($t6)
		ble $t6, $t5, else1
		move $t2, $t3
		else1:
		cont3:
		addu $t3, $t3, 1
		b loop3
		endl3:
		beq $t0, $t2, else2
		mulu $t3, $t0, 4
		addu $t3, $t3, $a0
		mulu $t4, $t2, 4
		addu $t4, $t4, $a0
		lw $t5, ($t3)
		lw $t6, ($t4)
		sw $t5, ($t4)
		sw $t6, ($t3)
		else2:
	cont2:
	addu $t0, $t0, 1
	b loop2
	endl2:
	func_end
	
	spin:
	j spin