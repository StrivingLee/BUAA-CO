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

.macro index(%dst, %line, %column, %rank)
    multu %line, %rank
    mflo %dst
    addu %dst, %column
    sll  %dst, %dst, 2
.end_macro

.macro done
    li   $v0, 10
    syscall
.end_macro

.data:
    a: .space 256
    b: .space 256
    out: .space 256
    space: .asciiz " "
    enter: .asciiz "\n"

.text:
    getint($s0)
    multu $s0, $s0
    mflo $s1 #s1=n*n
    li   $t0, 0 #loop var
    li   $t1, 0 #curaddr
read_a:
    beq  $t0, $s1, read_a_end
    addi $t0, $t0, 1
    sll  $t1, $t0, 2
    getint($t2)
    sw   $t2, a($t1)
read_a_end:
    li   $t0, 0
    li   $t1, 0 #curaddr
read_b:
    beq  $t0, $s1, read_a_end
    addi $t0, $t0, 1
    sll  $t1, $t0, 2
    getint($t2)
    sw   $t2, b($t1)
read_b_end:

    done