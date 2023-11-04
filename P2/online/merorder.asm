.macro getint(%dst)
	li   $v0, 5
	syscall
	move %dst, $v0
.end_macro

.macro printint(%src)
	move $a0, %src
	li   $v0, 1
	syscall
.end_macro

.macro end
	li   $v0, 10
	syscall
.end_macro

.macro printstr(%src)
	la   $a0, %src
	li   $v0, 4
	syscall
.end_macro

.macro push(%src)
	sw   %src, 0($sp)
	addi $sp, $sp, -4
.end_macro

.macro pop(%dst)
	addi $sp, $sp, 4
	lw   %dst, 0($sp)
.end_macro


.data
num1: .space 280
num2: .space 280
space: .asciiz " "
msg: .asciiz "ready\n"

.text
main:
	getint($s1) #n1, nums1 count
	li   $t0, 0
	num1_loop:
		bge  $t0, $s1, num1_loop_end
		getint($t7) #data
		sll  $t1, $t0, 2
		sw   $t7, num1($t1)
		addi $t0, $t0, 1
		j    num1_loop
	num1_loop_end:
	#printstr(msg)
	getint($s2) #n2, nums2 count
	li   $t0, 0
	num2_loop:
		bge  $t0, $s2, num2_loop_end
		getint($t7) #data
		sll  $t1, $t0, 2
		sw   $t7, num2($t1)
		addi $t0, $t0, 1
		j    num2_loop
	num2_loop_end:
	#printstr(msg)
	add  $s0, $s1, $s2
	li   $t1, 0
	li   $t2, 0
	li   $t0, 0
	sll  $t3, $s1, 2 #4n1
	sll  $t4, $s2, 2 #4n2
	#s3 and s4 are the pointers, 4 times
	output_loop:
		bge  $t0, $s0, output_loop_end
		lw   $t1, num1($s3)
		lw   $t2, num2($s4)
		beq  $s3, $t3, else
		beq  $s4, $t4, if
		bgt  $t1, $t2, else
		if: #t1 < t2
			printint($t1)
			addi $s3, $s3, 4
			j    if_end
		else:
			printint($t2)
			addi $s4, $s4, 4
		if_end:
		printstr(space)
		addi $t0, $t0, 1
		j    output_loop
	output_loop_end:
	end
