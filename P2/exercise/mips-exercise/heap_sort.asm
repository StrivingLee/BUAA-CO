.include "include/func_header.asm"
.include "include/lib.asm"

.data
	msg1: .asciiz "Numbers? "
	msg2: .asciiz "\nPlease input "
	msg3: .asciiz " numbers.\n"
	msg4: .asciiz "Sorted array: "
.globl start main make_heap shift_down heap_sort
.text

	start:
	jal main
	proc_end
	j spin
		
	main:
	func_start
	print_msg (msg1)
	read_int ($s0)
	print_msg (msg2)
	print_int ($s0)
	print_msg (msg3)
	mulu $t0, $s0, 4
	subu $sp, $sp, $t0
	xor $t0, $t0, $t0
	move $t1, $sp
	loop0:
	bge $t0, $s0, endl0
	read_int ($t2)
	sw $t2, ($t1)
	addu $t1, $t1, 4
	addu $t0, $t0, 1
	b loop0
	endl0:
	move $a0, $sp
	move $a1, $s0
	#li $a0, 0
	#move $a1, $sp
	#move $a2, $s0
	#print_int ($s0)
	#print_char ('\n')
	jal heap_sort
	#jal make_heap
	#jal shift_down
	print_msg (msg4)
	xor $t0, $t0, $t0
	loop4:
	bge $t0, $s0, endl4
	mulu $t1, $t0, 4
	addu $t1, $t1, $sp
	lw $t1, ($t1)
	print_int ($t1)
	print_char (' ') 
	addu $t0, $t0, 1
	b loop4
	endl4:
	
	func_end
	
	
	make_heap:
	func_start
	move $s1, $a0
	move $s2, $a1
	div $s0, $a1, 2
	loop1:
	bltz $s0, endl1
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	jal shift_down
	sub $s0, $s0, 1
	b loop1
	endl1:
	func_end
	
	shift_down:
	func_start

	loop2:
	mulu $t0, $a0, 2
	addu $t0, $t0, 2 # t0:p t1:j	
	bgt $t0, $a2, endl2
	subu $t1, $t0, 1
	bge $t1, $a2, endl2
	bge $t0, $a2, else0
	mulu $t2, $t0, 4
	mulu $t3, $t1, 4
	addu $t2, $t2, $a1
	addu $t3, $t3, $a1
	lw $t4, ($t2)
	lw $t5, ($t3) # t4:arr[p] $t5:arr[j]
	ble $t4, $t5, else0
	move $t1, $t0
	else0:
	mulu $t2, $t1, 4 # j
	mulu $t3, $a0, 4 # i
	addu $t2, $t2, $a1
	addu $t3, $t3, $a1
	lw $t4, ($t2) # arr[j]
	lw $t5, ($t3) # arr[i]
	ble $t4, $t5, endl2
	sw $t4, ($t3)
	sw $t5, ($t2)
	move $a0, $t1
	b loop2
	endl2:
	func_end
	
	heap_sort:
	func_start
	move $s0, $a0
	move $s1, $a1
	jal make_heap
	xor $s2, $s2, $s2
	loop3:
	bge $s2, $s1, endl3
	lw $t1, ($s0)
	subu $t2, $s1, $s2
	subu $t2, $t2, 1
	mulu $t2, $t2, 4
	addu $t2, $t2, $s0
	lw $t3, ($t2)
	sw $t1, ($t2)
	sw $t3, ($s0)
	li $a0, 0
	move $a1, $s0
	move $a2, $s1
	subu $a2, $a2, $s2
	subu $a2, $a2, 1
	jal shift_down
	addu $s2, $s2, 1
	b loop3
	endl3:
	func_end
	
	spin:
	j spin
