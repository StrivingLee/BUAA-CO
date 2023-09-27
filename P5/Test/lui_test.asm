lui $1, 0xffff
sw $1, 0($0)
lw $1, 0($0)
add $2, $1, $0
sw $2, 4($0)
lw $3, 4($0)
beq $1, $3, labeltrue
add $1, $3, $1
add $5, $4, $1
labeltrue:
add $5, $5, $5