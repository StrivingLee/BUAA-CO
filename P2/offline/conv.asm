.macro end
	li   $v0, 10
	syscall
.end_macro

.macro getInt(%dst)
	li   $v0, 5
	syscall
	move %dst, $v0
.end_macro

.macro printInt(%src)
	move $a0, %src
	li   $v0, 1
	syscall
.end_macro

.macro printStr(%src)
	la   $a0, %src
	li   $v0, 4
	syscall
.end_macro

.macro calc_addr(%dst, %cur_row, %cur_col, %col_num)
    multu %cur_row, %col_num
    mflo %dst
    addu %dst, %dst, %cur_col
    sll %dst, %dst, 2
.end_macro

.macro readMatrix(%src, %row, %column)
input_loop:
	li   $t0, 0
	loop_i:
		beq  $t0, %row, loop_i_end
		li   $t1, 0
		
		loop_j:
			beq  $t1, %column, loop_j_end
			getInt($t2)
			calc_addr($t3, $t0, $t1, %column)
			sw   $t2, %src($t3)
			addi $t1, $t1, 1
			j    loop_j
			
		loop_j_end:
			addi $t0, $t0, 1
			j    loop_i
	
	loop_i_end:
		
	li   $t0, 0
	li   $t1, 0
.end_macro

.data
matrix: .space 500
core:   .space 500
result: .space 500
space:  .asciiz " "
enter:  .asciiz "\n"

.text
	getInt($s0)
	getInt($s1)
	getInt($s2)
	getInt($s3)
	
	readMatrix(matrix, $s0, $s1)
	readMatrix(core, $s2, $s3)
	
calc_loop:
	subu $s4, $s0, $s2
	addi $s4, $s4, 1
	subu $s5, $s1, $s3
	addi $s5, $s5, 1 # the boundary
	li   $t0, 0
	loop_i:
		beq  $t0, $s4, loop_i_end
		li   $t1, 0
		
		loop_j:
			beq  $t1, $s5, loop_j_end
			li   $t2, 0  # $t2 is the counter of k
			li   $s6, 0  # $s6 is the sum of multiply, clean
			
			loop_k:
				beq  $t2, $s2, loop_k_end
				li   $t3, 0
				
				loop_l:
					beq  $t3, $s3, loop_l_end
					addu $t4, $t0, $t2 # i + k
					addu $t5, $t1, $t3 # j + l
					calc_addr($t6, $t4, $t5, $s1)
					calc_addr($t7, $t2, $t3, $s3)
					lw   $t4, matrix($t6)
					lw   $t5, core($t7)
					mulu $s7, $t4, $t5
					add  $s6, $s6, $s7
					addi $t3, $t3, 1
					j    loop_l
				
				loop_l_end:	
					calc_addr($t4, $t0, $t1, $s5)
					sw   $s6, result($t4)
					addi $t2, $t2, 1
					j    loop_k
				
			loop_k_end:
				addi $t1, $t1, 1
				j    loop_j
				
		loop_j_end:
			addi $t0, $t0, 1
			j    loop_i
			
	loop_i_end:
	
	li  $t0, 0
	li  $t1, 0
	li  $t2, 0
	li  $t3, 0
	
output_loop:
	loop_i_out:
		beq  $t0, $s4, loop_i_out_end
		li   $t1, 0
		
		loop_j_out:
			beq  $t1, $s5, loop_j_out_end
			calc_addr($t2, $t0, $t1, $s5)
			lw   $t3, result($t2)
			printInt($t3)
			printStr(space)
			addi $t1, $t1, 1
			j    loop_j_out
			
		loop_j_out_end:
			addi $t0, $t0, 1
			printStr(enter)
			j    loop_i_out
			
	loop_i_out_end:
	
	end
	
	