.data
    string1: .ascii "12345" # 将字符串存储在存储空间里，根据字符串长度自动分配空间
    string2: .asciiz "12345" # 与ascii的区别是会自动在末尾添加'\0'，避免了字符串的连接
.text
main:
    li $v0 4 # byte和ascii都是字符类型，参数为4
    la $a0 string1 # 将string2的地址传入
    syscall