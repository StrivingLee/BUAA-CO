ori   $28, $0, 0
ori   $29, $0, 0
ori   $1, $0, 13398
add   $1, $1, $1
lw    $1, 4($0)
sw    $1, 4($0)
lui   $2, 30840
sub   $3, $2, $1
lui   $5, 4660
ori   $4, $0, 5
nop
sw    $5, 65535($4)
lw    $3, 65535($4)