.macro calc_addr(%dst, %row, %column, %rank)
    # dts: the register to save the calculated address
    # row: the row that element is in
    # column: the column that element is in
    # rank: the number of lines(rows) in the matrix
    multu %row, %rank
    mflo %dst
    addu %dst, %dst, %column
    sll %dst, %dst, 2
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

.data
column: .space 2700
line:   .space 2700
value:  .space 2700
space: .asciiz " "
enter: .asciiz "\n"

.text
	getInt($s0) # read the column count m
	getInt($s1) # read the row count n
	li $t0, 0 # row counter
	li $t1, 0 # column counter
	
	fori:
		beq  $t0, $0, fori_end
		li   $t1, 0
		forj:
