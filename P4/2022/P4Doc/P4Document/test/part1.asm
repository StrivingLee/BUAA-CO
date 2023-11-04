ori $a0,$0,1999 # $a0 = 0x000007cf
ori $a1,$a0,111 # $a1 = 0x000007ef
add $s0,$a0,$a1 # $s0 = 0x00000fbe
lui $a2,12345
lui $a3,0xffff
ori $a3,$a3,0xffff
add $s0,$a0,$a1
add $s1,$a3,$a3
add $s2,$a3,$s0
sub $s0,$a0,$s2
sub $s1,$a3,$a3
sub $s2,$a3,$a0
sub $s3,$s2,$s1
ori $t0,$0,0x0000
