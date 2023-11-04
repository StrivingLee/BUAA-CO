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
	as: .space 280
	st: .space 280
	space: .asciiz " "
	enter: .asciiz "\n"
	msg: .asciiz "for end"
	
	
.text
main:
	getint($s0) #aSize
	li   $t0, 0
	read_loop:
		bge  $t0, $s0, read_end
		getint($t1) #data
		sll  $t2, $t0, 2
		sw   $t1, as($t2)
		addi $t0, $t0, 1
		j    read_loop
	read_end:
	
	li   $t0, 0 #i
	li   $s1, 0 #pos
	calc_loop:
		bge  $t0, $s0, calc_end
		li   $s2, 1 #alive
		sll  $t1, $t0, 2 #4i
		lw   $s3, as($t1) #as[i]
		while:
			beqz $s2, while_end
			bgez $s3, while_end
			blez $s1, while_end
			addi $t2, $s1, -1 #pos-1
			sll  $t2, $t2, 2
			lw   $s4, st($t2) #st[pos-1]
			blez $s4, while_end
			sub  $s5, $0, $s3 #-as[i]
			slt  $s2, $s4, $s5
			if:
				bgt  $s4, $s5, if_end
				addi $s1, $s1, -1
			if_end:
			j   while
		while_end:
		if_alive:
			blez $s2, if_alive_end
			sll  $t7, $s1, 2
			sw   $s3, st($t7)
			addi $s1, $s1, 1
		if_alive_end:
		addi $t0, $t0, 1
		j    calc_loop
	calc_end:
	
	printint($s1)
	printstr(enter)
	#printstr(msg)
	#printstr(enter)
	
	li   $t0, 0
	output_loop:
		bge  $t0, $s1, output_end
		sll  $t1, $t0, 2
		lw   $t2, st($t1)
		printint($t2)
		printstr(space)
		addi $t0, $t0, 1
		j    output_loop
	output_end:
	end
