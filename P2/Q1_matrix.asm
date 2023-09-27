.macro calc_addr(%dst, %row, %column, %rank)
    # dts: the register to save the calculated address
    # row: the row that element is in
    # column: the column that element is in
    # rank: the number of lines(rows) in the matrix
    multu %row, %rank
    mflo %dst
    addu %dst, %dst, %column
    sll %dst, %dst, 2
    # mulu %dst, %row, %rank
	# addu %dst, %dst, %column
	# sll  %dst, %dst, 2
.end_macro

.macro end
    li      $v0, 10
    syscall
.end_macro

.macro getInt(%des)
    li      $v0, 5
    syscall
    move    %des, $v0
.end_macro

.macro printInt(%src)
    move    $a0, %src
    li      $v0, 1
    syscall
.end_macro

.data
matrix1:     .space 300
matrix2:     .space 300
matrix_out:  .space 300
space:       .asciiz " "

.text
	getInt($s0) # read rank into $s0
	li   $t0, 0 # row counter
	li   $t1, 0 # column counter
	
input_loop_1:
	loop_i_1:
		beq  $t0, $s0, loop_i_end_1
		li   $t1, 0
		
		loop_j_1:
			beq  $t1, $s0, loop_j_end_1
			getInt($s1)
			calc_addr($s2, $t0, $t1, $s0)
			sw   $s1, matrix1($s2)
			addi $t1, $t1, 1
			j    loop_j_1
			
		loop_j_end_1:
			addi $t0, $t0, 1
			j    loop_i_1
	
	loop_i_end_1:
		
	li   $t0, 0
	li   $t1, 0
	
input_loop_2:
	loop_i_2:
		beq  $t0, $s0, loop_i_end_2
		li   $t1, 0
		
		loop_j_2:
			beq  $t1, $s0, loop_j_end_2
			getInt($s1)
			calc_addr($s2, $t0, $t1, $s0)
			sw   $s1, matrix2($s2)
			addi $t1, $t1, 1
			j    loop_j_2
			
		loop_j_end_2:
			addi $t0, $t0, 1
			j    loop_i_2
	
	loop_i_end_2:
	
	li  $t0, 0
	li  $t1, 0
	
calc_loop:
	loop_i:
		beq  $t0, $s0, loop_i_end
		li   $t1, 0
		
		loop_j:
			beq  $t1, $s0, loop_j_end
			li   $t2, 0  # $t2 is the counter of k
			li   $s3, 0  # $s3 is the sum of multiply, clean
			
			loop_k:
				beq  $t2, $s0, loop_k_end
				calc_addr($s4, $t0, $t2, $s0)
				calc_addr($s5, $t2, $t1, $s0)
				lw   $t3, matrix1($s4)
				lw   $t4, matrix2($s5)
				mulu $s4, $t3, $t4
				add  $s3, $s3, $s4
				addi $t2, $t2, 1
				j    loop_k
				
			loop_k_end:
				calc_addr($s2, $t0, $t1, $s0)
				sw   $s3, matrix_out($s2)
				addi $t1, $t1, 1
				j    loop_j
				
		loop_j_end:
			addi $t0, $t0, 1
			j    loop_i
			
	loop_i_end:
	
	li  $t0, 0
	li  $t1, 0
	
output_loop:
	loop_i_out:
		beq  $t0, $s0, loop_i_out_end
		li   $t1, 0
		
		loop_j_out:
			beq  $t1, $s0, loop_j_out_end
			# li   $t2, 0
			calc_addr($s2, $t0, $t1, $s0)
			lw   $s3, matrix_out($s2)
			printInt($s3)
			# printStr(space)
			la   $a0, space
			li   $v0, 4
			syscall
			addi $t1, $t1, 1
			j    loop_j_out
			
		loop_j_out_end:
			addi $t0, $t0, 1
			# printStr(space)
			j    loop_i_out
			
	loop_i_out_end:
	
	end
				
	
	
			
		
