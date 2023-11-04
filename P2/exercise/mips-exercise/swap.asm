.data
	msg1: .asciiz "String1: "
	msg2: .asciiz "String2: "
	str1: .asciiz "Hello\n"
	str2: .asciiz "World\n"
	msg3: .asciiz "After swap:\n"
	
.globl main
.text
	main:
	la $a0, msg1
	li $v0, 4
	syscall
	la $a0, str1
	li $v0, 4
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	la $a0, str2
	li $v0, 4
	syscall 
	xor $t0, $t0, $t0
	loop:
	lb $t1, str1($t0)
	lb $t2, str2($t0)
	beqz $t1, fin
	beqz $t2, fin
	sb $t2, str1($t0)
	sb $t1, str2($t0)
	addu $t0, $t0, 1
	b loop
	fin:
	la $a0, msg3
	li $v0, 4
	syscall
	la $a0, msg1
	li $v0, 4
	syscall
	la $a0, str1
	li $v0, 4
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	la $a0, str2
	li $v0, 4
	syscall 	