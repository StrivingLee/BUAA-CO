lui $t0, 0xffff
ori $t0 ,$t0, 0xffff
boez $t0, $t1, label
ori $s0, 1
label:
ori $s1, 1