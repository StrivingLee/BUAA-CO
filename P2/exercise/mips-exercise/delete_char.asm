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

.macro read_str(%str, %num)
li $v0, 8
la $a0, %str
li $a1, %num
syscall
.end_macro

.macro print_str(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

.data
	.align 2
	str: .space 1024
	.align 2
	charset: .space 1024 
	msg1: .asciiz "\nPlease input string:"
	msg2: .asciiz "\nPlease input charset:"
	msg3: .asciiz "\nResult:"
.globl start main delete_char strlen
.text
	start:
	jal main
	proc_end
	j spin

	main:
	func_start
	print_str (msg1)
	read_str (str, 1024)
	print_str (msg2)
	read_str (charset, 1024)
	print_str (msg3)
	la $a0, str
	la $a1, charset
	jal delete_char
	move $a0, $v0
	li $v0, 4
	syscall
	func_end
	
	delete_char:
	func_start
	subu $sp, $sp, 1024
	move $v0, $a0
	beq $a1, 0, return
	xor $t0, $t0, $t0
	loop0:
	bge $t0, 256, endl0
	mulu $t1, $t0, 4
	addu $t1, $t1, $sp
	sw $zero, ($t1)
	cont0:
	addu $t0, $t0, 1
	b loop0
	endl0:
	subu $sp, $sp, 4
	sw $a0, ($sp)
	move $a0, $a1
	jal strlen
	move $t1, $v0
	lw $a0, ($sp)
	addu $sp, $sp, 4
	xor $t0, $t0, $t0
	loop1:
	bgt $t0, $t1, endl1
	addu $t2, $t0, $a1
	lb $t2, ($t2)
	mulu $t2, $t2, 4
	addu $t2, $t2, $sp
	li $t3, 1
	sw $t3, ($t2)
	cont1:
	addu $t0, $t0, 1
	b loop1
	endl1:
	subu $sp, $sp, 4
	sw $a0, ($sp)
	jal strlen
	move $t1, $v0
	lw $a0, ($sp)
	addu $sp, $sp, 4
	xor $t0, $t0, $t0
	xor $t3, $t3, $t3
	loop2:
	bgt $t0, $t1, endl2
	addu $t2, $a0, $t0
	lb $t2, ($t2)
	mulu $t2, $t2, 4
	addu $t2, $t2, $sp
	lw $t2, ($t2)
	bnez $t2, else
	addu $t4, $a0, $t3
	addu $t3, $t3, 1
	addu $t5, $t0, $a0
	lb $t5, ($t5)
	sb $t5, ($t4)
	else:
	cont2:
	addu $t0, $t0, 1
	b loop2
	endl2:
	addu $t3, $a0, $t3
	sb $zero, ($t3)
	move $v0, $a0
	return:
	func_end
	
	strlen:
	func_start
	xor $t0, $t0, $t0
	strlen_loop:
	lb $t1, ($a0)
	beq $t1, 0, strlen_endl
	addu $t0, $t0, 1
	addu $a0, $a0, 1
	b strlen_loop
	strlen_endl:
	move $v0, $t0
	func_end
	
	spin:
	j spin