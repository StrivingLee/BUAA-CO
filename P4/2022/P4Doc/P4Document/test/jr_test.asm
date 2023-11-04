ori $s0, 1
ori $s1, 1
jalr jump
ori $s1, 9
ori $s2, 2
ori $s3, 6
li $v0, 10
syscall

jump:
ori $s3, 15
jr $ra