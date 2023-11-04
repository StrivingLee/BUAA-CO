.data
    age: .word 23 # 将一个整数保存在一个4字节的存储空间里
.text
main:
    li $v0 1
    lw $a0 age # 可能是因为int的原因，只能传入int的值，无法传入地址
    syscall
