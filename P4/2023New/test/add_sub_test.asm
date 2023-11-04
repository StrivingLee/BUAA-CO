ori $a0,$0,0x7cf
ori $a1,$a0,0x6f
lui $a2,12345
lui $a3,0xffff
ori $a3,$a3,0xffff # here a3 is ffffffff, after no change
add $s0,$a0,$a1 # here s0 is fbe
add $s1,$a3,$a3 # here s1 is fffffffe
add $s2,$a3,$s0 # here s2 is fbd
sub $s0,$a0,$s2 # here s0 is fffff812, after no change
sub $s1,$a3,$a3 # here s1 is 0, after no change
eee:
sub $s2,$a3,$a0 # here s2 is fffff830, after no change
sub $s3,$s2,$s1 # here s3 is fffff830, after no change