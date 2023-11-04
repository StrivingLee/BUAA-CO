.data
	tb: .byte '\t'
.globl main
.text
	main:
	li $t0, 2
	loop0:
	li $t1, 2
	div $t2, $t1, 2 # t2: limit
	loop1:
	div $t0, $t1
	mfhi $t3
	beqz $t3, continue
	add $t1, $t1, 1
	blt $t1, $t2, loop1
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	continue:
	add $t0, $t0, 1
	blt $t0, 100, loop0
	li $v0, 10
	syscall