lui $t0, 0x6e00
lui $t1, 0x1a00
bioal $t0, $t1, true
ori $t0, $0, 0x1145
ori $t3, $t0, 0x1919
true:
ori $t4, $t0, 0x810
bioal $0, $0, false
nop
add $s0, $s0, $t0
false:
add $s0, $s0, $s0

