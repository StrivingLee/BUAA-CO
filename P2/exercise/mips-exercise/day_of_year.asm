.data
	msg1: .asciiz "Please input year:"
	msg2: .asciiz "Please input month:"
	msg3: .asciiz "Please input day:"
	msg4: .asciiz "It's the no."
	msg5: .asciiz " day of the year\n"
	msg6: .asciiz "Data error\n"
	.align 2
	jan: .word 0
	feb: .word 31
	mar: .word 59
	apr: .word 90
	may: .word 120
	jun: .word 151
	jly: .word 181
	aug: .word 212
	sep: .word 243
	oct: .word 273
	nov: .word 304
	dec: .word 334

.globl main day_of_year
.text
	main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
	jal day_of_year
	move $t0, $v0
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 10
	syscall		
	
	day_of_year:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addu $fp, $sp, 8
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	li $a0, '.'
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 11
	li $a0, '.'
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 11
	li $a0, '\n'
	syscall
	beq $a1, 1, isJan
	beq $a1, 2, isFeb
	beq $a1, 3, isMar
	beq $a1, 4, isApr
	beq $a1, 5, isMay
	beq $a1, 6, isJun
	beq $a1, 7, isJly
	beq $a1, 8, isAug
	beq $a1, 9, isSep
	beq $a1, 10, isOct
	beq $a1, 11, isNov
	beq $a1, 12, isDec
	b default
	isJan:
	lw $t3, jan
	b fin
	isFeb:
	lw $t3, feb
	b fin
	isMar:
	lw $t3, mar
	b fin
	isApr:
	lw $t3, apr
	b fin 
	isMay:
	lw $t3, may
	b fin
	isJun:
	lw $t3, jun
	b fin
	isJly:
	lw $t3, jly
	b fin
	isAug:
	lw $t3, aug
	b fin
	isSep:
	lw $t3, sep
	b fin
	isOct:
	lw $t3, oct
	b fin
	isNov:
	lw $t3, nov
	b fin
	isDec:
	lw $t3, dec
	b fin
	default:
	li $v0, 4
	la $a0, msg6
	syscall
	li $v0, -1
	j return
	fin:
	addu $t3, $t3, $t2
	rem $t4, $t0, 400
	seq $t4, $t4, $zero
	rem $t5, $t0, 4
	seq $t5, $t5, $zero
	rem $t6, $t0, 100
	sne $t6, $t6, $zero
	and $t5, $t5, $t6
	or $t4, $t4, $t5
	beqz $t4, notleap
	blt $t1, 2, lt2
	addu $t3, $t3, 1
	move $v0, $t3
	j return
	lt2:
	move $v0, $t3
	j return
	notleap:
	move $v0, $t3
	return:
	move $sp, $fp
	lw $ra, -8($fp)
	lw $fp, -4($fp) 
	jr $ra