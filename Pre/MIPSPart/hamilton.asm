.macro done
    li   $v0, 10
    syscall
.end_macro

.macro getint(%dst)
    li   $v0, 5
    syscall
    move %dst, $a0
.end_macro

.macro printint(%src)
    move $a0, %src
    li   $v0, 1
    syscall
.end_macro

.macro printstr(%src)
    la   $a0, %src
    li   $v0, 4
    syscall
.end_macro

.macro  getindex(%ans, %i, %j)
    sll %ans, %i, 3             # %ans = %i * 8
    add %ans, %ans, %j          # %ans = %ans + %j
    sll %ans, %ans, 2           # %ans = %ans * 4
.end_macro


.data
matrix: .space 256
book: .space 32


.text
main:
    getint($s0) # n
    getint($s1) # m
    li   $t0, 0 # loop var
    sll  $s2, $s1, 1 # 2*m
loop:
    beq  $t0, $s2, loop_end # loop

done