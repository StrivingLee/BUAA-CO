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

#push
.macro push(%src)
    sw      %src, 0($sp)
    subi    $sp, $sp, 4
.end_macro

#pop
.macro pop(%des)
    addi    $sp, $sp, 4
    lw      %des, 0($sp)
.end_macro

.data 
symbol: .space 28
array:  .space 28
space:  .asciiz " "
enter:  .asciiz "\n"

.text
main:
	getInt($s0) # read n into $s0
	
	move $a0, $0 # $a0 is index
	jal  FullArray
	
	end
	
FullArray:
	move $t0, $a0 # $t0 is index

if1:
	blt  $t0, $s0, else1
	li   $t1, 0 # $t1 is counter i
print_loop:
	beq  $t1, $s0, print_loop_end
	sll  $t2, $t1, 2
	lw   $t3, array($t2)
	printInt($t3)
	printStr(space)
	addi $t1, $t1, 1
	j    print_loop
print_loop_end:
	printStr(enter)
	jr   $ra
else1:
	li   $t3, 0 # $t1 is counter i
loop:
	beq  $t3, $s0, loop_end
	sll  $t2, $t3, 2 # $t2 is byte offset of i
	lw   $t4, symbol($t2)
if2:
	bnez $t4, else2
	sll  $t4, $t0, 2 # $t4 is byte offset of index
	sub  $t5, $s0, $t3
	sw   $t5, array($t4)
	li   $t5, 1 # reuse $t3 as the input1
	sw   $t5, symbol($t2) # set symbol[i] 1
	
	push($ra)
	push($t0)
	push($t3)
	addi $a0, $t0, 1 # index + 1
	# move $t0, $t5
	jal  FullArray
	pop($t3)
	pop($t0)
	pop($ra)
	sll  $t2, $t3, 2 # $t2 is byte offset of i
	li   $t5, 0
	sw   $t5, symbol($t2)
else2:
	addi $t3, $t3, 1
	j    loop
loop_end:	
	jr   $ra
