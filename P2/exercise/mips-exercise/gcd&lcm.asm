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
la $a0, %msg
li $v0, 4
syscall
.end_macro

.macro print_int(%reg)
move $a0, %reg
li $v0, 1
syscall
.end_macro

.macro read_int(%reg)
li $v0, 5
syscall
move %reg, $v0
.end_macro

.data
	msg1: .asciiz "Please input two numbers:\n"
	msg2: .asciiz "GCD is:"
	msg3: .asciiz "\nLCM is:"
.globl start main gcd_lcm
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	print_msg (msg1)
	read_int ($t0)
	read_int ($t1)
	move $a0, $t0
	move $a1, $t1
	jal gcd_lcm
	move $t0, $v0
	move $t1, $v1
	print_msg (msg2)
	print_int ($t0)
	print_msg (msg3)
	div $t2, $t1, $t0
	print_int ($t2)
	func_end
	
	gcd_lcm:
	func_start
	move $t1, $a0
	move $t2, $a1
	bge $t1, $t2, else
	move $t3, $t2
	move $t2, $t1
	move $t1, $t3
	rem $t4, $t1, $t2
	mul $t5, $t1, $t2
	else:
	loop:
	beqz $t4, endloop
	move $t1, $t2
	move $t2, $t4
	rem $t4, $t1, $t2
	b loop
	endloop:
	move $v0, $t2
	move $v1, $t5
	func_end
	
	spin:
	j spin