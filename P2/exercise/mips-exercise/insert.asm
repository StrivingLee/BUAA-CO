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
	msg1: .asciiz "Origin array is:"
	msg2: .asciiz "\nPlease input a number to insert into the array.\n"
	msg3: .asciiz "\nResult:"
	arr: .word 1,4,6,9,13,16,19,28,40,100,0
.globl start main
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
	xor $t0, $t0, $t0
	loop0:
	bge $t0, 10, endl0
	li $v0, 1
	mulu $a0, $t0, 4
	la $t1, arr
	addu $a0, $a0, $t1
	lw $a0, ($a0)
	syscall
	li $v0, 11
	la $a0, ' '
	syscall
	addu $t0, $t0, 1
	b loop0
	endl0:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	la $t0, arr
	addu $t0, $t0, 36
	lw $t0, ($t0)
	ble $s0, $t0 else0
	la $t1, arr
	addu $t1, $t1, 40
	sw $s0, ($t1)
	else0:
	xor $t0, $t0, $t0
	loop1:
	bge $t0, 10, endl1
	mul $t1, $t0, 4
	la $t2, arr
	addu $t1, $t1, $t2
	lw $t2, ($t1)
	blt $t2, $s0, else1
	sw $s0, ($t1)
		addu $t3, $t0, 1
		loop2:
		bge $t3, 11, endl2
		mulu $t4, $t3, 4
		la $t5, arr
		addu $t4, $t4, $t5
		lw $t5, ($t4)
		sw $t2, ($t4)
		move $t2, $t5
		cont2:
		addu $t3, $t3, 1
		b loop2
		endl2:
		b endl1
	else1:
	cont1:
	addu $t0, $t0, 1
	b loop1
	endl1:
	
	li $v0, 4
	la $a0, msg3
	syscall
	xor $t0, $t0, $t0
	loop3:
	bge $t0, 11, endl3
	li $v0, 1
	mulu $a0, $t0, 4
	la $t1, arr
	addu $a0, $a0, $t1
	lw $a0, ($a0)
	syscall
	li $v0, 11
	la $a0, ' '
	syscall
	addu $t0, $t0, 1
	b loop3
	endl3:
	
	
	
	func_end
	
	
	spin:
	j spin