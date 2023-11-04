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

.data

.text
main:
	li   $t0, 2
	li   $t1, 3
	jal  cal
	printint($s0)
	
	end
	
	
sum:
	add  $v0, $a0, $a1
	
	jr   $ra
	
	
cal:
	sw   $ra, 0($sp)
	addi $sp, $sp, -4
	move $a0, $t0
	move $a1, $t1
	jal  sum
	sub  $s0, $t1, $v0
	addi $sp, $sp, 4
	lw   $ra, 0($sp)
	
	jr   $ra
