ori $t0, 0x1111
ori $t1, 1
beq $t0, $t1, label
#jal label 
ori $t6, 6
label:
ori $t2, 4
ori $t3, 5
ori $t4, 1
ori $t5, 4