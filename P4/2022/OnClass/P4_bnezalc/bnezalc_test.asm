ori $t0, $0, 1
lui $t1, 0xffff
ori $t1, $t1, 0xffff
ori $s0, 1
ori $s1, 1
ori $s2, 4
bnezalc $t2, labelfalse
ori $s3, 5
labelfalse:
ori $s4, 1
bnezalc $t0, labeltrue
ori $s5, 6
labeltrue:
ori $s5, 4