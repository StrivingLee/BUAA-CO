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

.macro scan_msg(%msg, %num)
li $v0, 8
la $a0, %msg
li $a1, %num
syscall
.end_macro

.macro print_int(%reg)
move $a0, %reg
li $v0, 1
syscall
.end_macro

.data
	msg1: .asciiz "Please input string: "
	msg2: .asciiz "\nletters:"
	msg3: .asciiz "\nnumbers:"
	msg4: .asciiz "\nspaces:"
	msg5: .asciiz "\nother:"
	msg6: .asciiz "\nerror occurred\n"
	.align 2
	buffer: .space 1024
	.align 2
	result: .space 16
.globl start main count
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	print_msg (msg1)
	scan_msg (buffer, 1020)
	la $a0, buffer
	la $a1, result
	jal count
	bnez $v0, main_err
	print_msg (msg2)
	lw $t0, result + 0
	print_int ($t0)
	print_msg (msg3)
	lw $t0, result + 4
	print_int ($t0)
	print_msg (msg4)
	lw $t0, result + 8
	print_int ($t0)
	print_msg (msg5)
	lw $t0, result + 12
	print_int ($t0)
	main_err:
	func_end
	
	count:
	func_start
	xor $t0, $t0, $t0
	sw $t0, 0($a1)
	sw $t0, 4($a1)
	sw $t0, 8($a1)
	sw $t0, 12($a1)
	move $t0, $a0
	loop:
	lb $t1, ($t0)
	beqz $t1, endloop
	sle $t3, $t1, 'z'
	sge $t4, $t1, 'a'
	and $t3, $t3, $t4
	sle $t4, $t1, 'Z'
	sge $t5, $t1, 'A'
	and $t4, $t4, $t5
	or $t3, $t3, $t4
	bnez $t3, islet
	sle $t3, $t1, '9'
	sge $t4, $t1, '0'
	and $t3, $t3, $t4
	bnez $t3, isnum
	beq $t1, ' ', isspc
	isoth:
	lw $t2, 12($a1)
	addu $t2, $t2, 1
	sw $t2, 12($a1)
	b cont
	isnum:
	lw $t2, 4($a1)
	addu $t2, $t2, 1
	sw $t2, 4($a1)
	b cont
	islet:
	lw $t2, 0($a1)
	addu $t2, $t2, 1
	sw $t2, 0($a1)
	b cont
	isspc:
	lw $t2, 8($a1)
	addu $t2, $t2, 1
	sw $t2, 8($a1)
	b cont
	cont:
	addu $t0, $t0, 1
	b loop
	endloop:
	li $v0, 0
	func_end
	
	spin:
	j spin
