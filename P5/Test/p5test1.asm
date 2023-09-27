lui $t0, 0x00ff
ori $t0, $t0, 0xffff
ori $t1, $0, 1
beq $t0, $t1, labelfalse
ori $t2, $0, 1
ori $t3, $0, 4
labelfalse:
ori $t4, $0, 5
beq $t1, $t1, labeltrue
ori $s0, $0, 1
lui $s1, 1
labeltrue:
ori $s1, $0, 9
add $s2, $t1, $0
sub $s3, $s1, $0

