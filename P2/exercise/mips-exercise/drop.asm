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

.data
	msg1: .asciiz "Please input height:"
	msg2: .asciiz "\nTotal:"
	msg3: .asciiz "\nLast height:"
	.align 2
	flt: .float 2
.globl start main drop
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	mov.s $f2, $f1
	jal drop
	func_end
	
	drop:
	func_start
	l.s $f3, flt
	div.s $f1, $f1, $f3
	li $t0, 2
	loop:
	bgt $t0, 10, endl
	mul.s $f0, $f1, $f3
	add.s $f2, $f2, $f0
	div.s $f1, $f1 $f3
	cont:
	addu $t0, $t0, 1
	b loop
	endl:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 2
	mov.s $f12, $f2
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 2
	mov.s $f12, $f1
	syscall
	func_end
	
	spin:
	j spin