#lui $t0, 0xff00
#ori $t0, $t0, 0x00ff
bpnal $t0, true
ori $s0, $0, 1
true:
ori $s1, $0, 1