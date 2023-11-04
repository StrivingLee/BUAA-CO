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

.macro print_char(%char)
li $v0, 11
li $a0, %char
syscall
.end_macro

.macro print_int(%reg)
li $v0, 1
move $a0, %reg
syscall
.end_macro

.data
	.align 2
	array: .space 1024

.globl start main print
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	jal print
	func_end
	
	print:
	func_start
	li $t0, 2
	loop0:
	bgt $t0, 1000, endl0
	li $t4, 1
	sw $t4, array
	xor $t2, $t2, $t2
	li $t1, 2
	loop1:
	div $t5, $t0, 2
	bgt $t1, $t5, endl1
	rem $t5, $t0, $t1
	bnez $t5, else0
	addu $t4, $t4, $t1
	addu $t2, $t2, 1
	mulu $t5, $t2, 4
	sw $t1, array($t5)
	else0:
	cont1:
	addu $t1, $t1, 1
	b loop1
	endl1:
	bne $t0, $t4, else1
	print_int ($t0)
	print_char ('=')
	lw $t5, array
	print_int ($t5)
	li $t3, 1
	loop2:
	bgt $t3, $t2, endl2
	print_char ('+')
	mulu $t5, $t3, 4
	lw $t5, array($t5)
	print_int ($t5)
	cont2:
	addu $t3, $t3, 1
	b loop2
	endl2:
	print_char ('\n')
	else1:
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	li $v0, 0
	func_end
	
	spin:
	j spin
