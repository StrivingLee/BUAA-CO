bgezal $0, true
ori    $s0, $0, 1
true:
ori    $s1, $0, 1
sub    $s1, $0, $s1 #s1=-1
bgezal $s1, false
lui    $s2, 0x1234
false: