.data # ������������
    # name: .type values
    char: .byte 'M' # ��һ���ַ�������һ���ֽڵĴ洢�ռ���
    endline: .byte '\n' # ���ã����з�
    # �ǵ��ַ�Ҫʹ�õ���������
.text # ��������
main:
    li $v0 4 # ��ʾ���$a0��char���͵�����
    la $a0 char # ��char�����ĵ�ַ������$a0��
    syscall