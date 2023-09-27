.macro done
    li   $v0, 10
    syscall
.end_macro

.macro getint(%dst)
    li   $v0, 5
    syscall
    move %dst, $v0
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
.text
main:
    getint($s0) #n
    li   $s1, 0 #prefix sum
    li   $s2, 0 #maximum value
    li   $t0, 0 #loop var

for_loop:
    getint($t1) #data
    add  $s1, $s1, $t1
if:
    blt  $s1, $s2, else
    move $s2, $s1
else:
    addi $t0, $t0, 1
    bne  $t0, $s0, for_loop

loop_end:
    printint($s2)
    done
