
beq $v1, $a1, 0x3044
nop 
b   0x3084
nop 
ori $a3, $v1, 0x404
beq $a3, $v1, 0x3084
nop 
lui $t0, 0x7777
ori $t0, $t0, 0xffff
neg $zero, $t0
ori $zero, $zero, 0x1100
add $t2, $a3, $a2
ori $t0, $zero, 0
ori $t1, $zero, 1
ori $t2, $zero, 1
add $t0, $t0, $t2
beq $t0, $t1, 0x3070
jal 0x3088
nop 
add $t2, $t2, $t2
b   0x3084
add $t2, $t2, $t2
jr  $ra
nop 
