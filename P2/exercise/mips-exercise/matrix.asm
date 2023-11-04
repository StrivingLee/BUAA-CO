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
	msg1: .asciiz "Please input matrix (3*3)\n"
	msg2: .asciiz "Sum is:"
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	subu $sp, $sp, 36
	li $v0, 4
	la $a0, msg1
	syscall
	xor $t0, $t0, $t0
	loop0:
	bge $t0, 3, endl0
		xor $t1, $t1, $t1
		loop1:
		bge $t1, 3, endl1 
		mulu $t2, $t0, 12
		mulu $t3, $t1, 4
		addu $t2, $t2, $t3
		addu $t2, $t2, $sp
		li $v0, 5
		syscall
		sw $v0, ($t2)
		cont1:
		addu $t1, $t1, 1
		b loop1
		endl1:
	
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	xor $t0, $t0, $t0
	xor $s0, $s0, $s0
	loop3:
	bge $t0, 3, endl3
	mulu $t1, $t0, 12
	mulu $t2, $t0, 4
	addu $t1, $t1, $t2
	addu $t1, $t1, $sp
	lw $t1, ($t1)
	addu $s0, $s0, $t1
	cont3:
	addu $t0, $t0, 1
	b loop3
	endl3:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	func_end
	
	spin:
	j spin