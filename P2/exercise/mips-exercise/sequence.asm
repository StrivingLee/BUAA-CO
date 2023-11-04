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
	f_sum: .float 0
	f_a: .float 2
	f_b: .float 1
.globl start main
.text
	start:
	jal main
	proc_end
	j spin
	
	main:
	func_start
	li $t0, 1
	lwc1 $f0, f_sum
	lwc1 $f1, f_a
	lwc1 $f2, f_b
	loop:
	bgt $t0, 20, endl
	div.s $f3, $f1, $f2
	add.s $f0, $f0, $f3
	floor.w.s $f3, $f1
	mfc1 $t1, $f3
	add.s $f1, $f1, $f2
	mtc1 $t1, $f2
	cvt.s.w $f2, $f2
	cont:
	addu $t0, $t0, 1
	b loop
	endl:
	mov.s $f12, $f0
	li $v0, 2
	syscall
	func_end
	
	spin:
	j spin