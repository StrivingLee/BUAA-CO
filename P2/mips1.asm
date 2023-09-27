.data
    data: .word 0 : 100       # storage for 10x10 matrix of words

.text
    li $v0, 5          # $v0 = rank
    move $s0, $zero    # $s0 = row counter
    move $s1, $zero    # $s1 = column counter
    move $t2, $zero    # $t2 = the value to be stored
    #________ tag1 _______
loop:
    mult $s0, $t1      # $s2 = row * cols (two-instruction sequence)
    mflo $s2           # move multiply result from lo register to $s2
    add $s2, $s2, $s1  # $s2 += column counter
    sll $s2, $s2, 2    # $s2 *= 4 (shift left 2 bits) for byte offset
    sw $t2, data($s2)  # store the value in matrix element
#---------------------  

#________ tag2 _______
    addi $t2, $t2, 1   # increment value to be stored
#---------------------  

# Loop control: If we increment past last column, reset colume counter and increment row counter
#               If we increment past last row,we're finished.

#________ tag3 _______
    addi $s1, $s1, 1   # increment coumn counter
#---------------------  

    bne $s1, $t1, loop # not at end of row so loop back
    move $s1, $zero    # reset column counter
    addi $s0, $s0, 1   # increment row counter
    bne $s0, $t0, loop # not at end of matrix so loop back
# We're finished traversing the matrix
    li $v0, 10         # system service 10 is exit
    syscall            # we are outta here