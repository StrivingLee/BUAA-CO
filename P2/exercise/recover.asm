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


.data
    array: .space 48 
    space: .asciiz " "


.text
main:
    li   $t0, 0 # count var
    li   $s0, 12

for_loop:
    printint($t0)
    printstr(space)
    addi $t0, $t0, 1
    beq  $t0, $s0, loop_end
    j    for_loop

loop_end:
    done