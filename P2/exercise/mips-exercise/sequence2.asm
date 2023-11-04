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
	.align 3
	sum: .double 0.0
	mix: .double 1.0
.globl start main
.text
	start:
	jal main
	proc_end	
	j spin
	
	main:
	func_start
	li $t0, 1
	l.d $f2, sum
	l.d $f4, mix
	loop:
	bgt $t0, 20, endl
	mtc1 $t0, $f0
	cvt.d.w $f0, $f0
	mul.d $f4, $f4, $f0
	add.d $f2, $f2 $f4
	cont:
	addu $t0, $t0, 1
	b loop
	endl:
	mov.d $f12, $f2
	li $v0, 3
	syscall
	func_end
	
	spin:
	j spin