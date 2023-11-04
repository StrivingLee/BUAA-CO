.macro getint(%dst)
	li   $v0, 5
	syscall
	move %dst, $v0
.end_macro

.macro end
	li   $v0, 10
	syscall
.end_macro

.macro printint(%src)
	move $a0, %src
	li   $v0, 1
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

.text
main:
	getint($s0)
	move $a0, $s0
	jal  fact
	move $s1, $v0
	printint($s1)
	
	end
	
	
fact:
	push($ra)
	push($t0)
	move $t0, $a0
	bne  $t0, 1, else
	if:
		li  $v0, 1
		j   if_end
	else:
		subi $t1, $t0, 1
		move $a0, $t1
		jal  fact
		mult $t0, $v0
		mflo $v0
	if_end:
	pop($t0)
	pop($ra)
	jr   $ra
	