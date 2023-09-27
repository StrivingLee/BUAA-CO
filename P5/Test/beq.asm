lui $t0, 0xf00f
lui $t1, 0xf00f
beq $t0, $t1, true
ori $t0, $0, 0x1145
ori $t3, $t0, 0x1919
true:
ori $t4, $t0, 0x810