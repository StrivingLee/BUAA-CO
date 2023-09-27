.data # 数据声明区域
    # name: .type values
    char: .byte 'M' # 将一个字符保存在一个字节的存储空间里
    endline: .byte '\n' # 常用，换行符
    # 记得字符要使用单引号声明
.text # 代码区域
main:
    li $v0 4 # 表示输出$a0中char类型的内容
    la $a0 char # 将char常量的地址保存在$a0中
    syscall