.data
	msg1: .asciiz "String1:"
	msg2: .asciiz "\nString2:"
	.align 2
	str1: .space 100
	str2: .space 100
	msg3: .asciiz "Not same\n"
	msg4: .asciiz "Same\n"
	msg5: .asciiz "Result:"
.globl main
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	la $a0, str1
	li $a1, 100
	li $v0, 8
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	la $a0, str2
	li $a1, 100
	li $v0, 8
	syscall
	li $v0, 4
	la $a0, msg5
	syscall
	xor $t0, $t0, $t0
	la $t1, str1
	la $t2, str2
	loop:
	add $t3, $t1, $t0
	add $t4, $t2, $t0
	lb $t3, ($t3)
	lb $t4, ($t4)
	bne $t3, $t4, failure
	beqz $t3, success
	cont:
	addu $t0, $t0, 1
	b loop
	failure:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 10
	syscall
	success:
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 10
	syscall
	
	
	
	