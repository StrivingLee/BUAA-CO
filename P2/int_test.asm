.data
    age: .word 23 # ��һ������������һ��4�ֽڵĴ洢�ռ���
.text
main:
    li $v0 1
    lw $a0 age # ��������Ϊint��ԭ��ֻ�ܴ���int��ֵ���޷������ַ
    syscall
