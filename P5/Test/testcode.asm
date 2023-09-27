ori $gp, $zero, 0
ori $sp, $zero, 0
ori $at, $zero, 0x1010
lui $v0, 0x8723
ori $v1, $zero, 0x7856
lui $a0, 0x85ff
ori $a1, $zero, 1
lui $a2, 0xffff
ori $a3, $zero, 0xffff
add $at, $at, $v0
add $t1, $at, $v1
sub $t0, $at, $v0
sub $zero, $a3, $zero
beq $gp, $s1, 0x3044
nop 
beq $0, $0, 0x3094
nop 
beq $at, $v0, 0x3094
nop 
ori $v0, $zero, 0xc
nop 
nop 
nop 
jal 0x306c
sw  $at, 0($v0)
beq $0, $0, 0x3094
add $at, $at, $v0
add $at, $at, $v0
add $at, $at, $v0
add $at, $at, $v0
sw  $ra, 0($v0)
lw  $at, 0($v0)
nop 
nop 
nop 
jr  $at
sw  $ra, 0($v0)
beq $0, $0, 0x3094
nop 