.data
    string1: .ascii "12345" # ���ַ����洢�ڴ洢�ռ�������ַ��������Զ�����ռ�
    string2: .asciiz "12345" # ��ascii�������ǻ��Զ���ĩβ���'\0'���������ַ���������
.text
main:
    li $v0 4 # byte��ascii�����ַ����ͣ�����Ϊ4
    la $a0 string1 # ��string2�ĵ�ַ����
    syscall