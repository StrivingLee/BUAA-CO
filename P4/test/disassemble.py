def disassemble(mips_code):
    opcode_dict = {
        '000000': 'R-type',
        '000010': 'j',
        '000011': 'jal',
        '000100': 'beq',
        '000101': 'bne',
        '001000': 'addi',
        '001100': 'andi',
        '001101': 'ori',
        '001111': 'lui',
        '100011': 'lw',
        '101011': 'sw',
        # 添加更多的指令和对应的操作码
    }
    funct_dict = {
        '000000': 'sll',
        '001000': 'jr',
        '001001': 'jalr',
        '100000': 'add',
        '100010': 'sub',
    }

    opcode = mips_code[:6]
    funct = mips_code[-6:]
    rs = int(mips_code[6:11], 2)
    rt = int(mips_code[11:16], 2)
    rd = int(mips_code[16:21], 2)
    immediate = int(mips_code[16:], 2)
    instr_index = int(mips_code[6:], 2)

    if mips_code == '0' * 32:
        return 'nop'
    elif opcode == '000000':  # R-type指令
        op = funct_dict.get(funct)
        formatted_op = f'{op:<5}'
        # 根据不同的funct值解析对应的R-type指令
        if funct in funct_dict:
            return f'{formatted_op} ${rd}, ${rs}, ${rt}'
        else:
            return 'Unsupported Instruction'
        # 添加更多的R-type指令解析
    elif opcode in opcode_dict:  # 其他指令
        op = opcode_dict.get(opcode)
        formatted_op = f'{op:<5}'
        if op == 'j' or op == 'jal':
            return f'{formatted_op} {instr_index}'
        elif op == 'beq' or op == 'bne':
            return f'{formatted_op} ${rs}, ${rt}, {immediate}'
        elif op == 'addi' or op == 'andi' or op == 'ori':
            return f'{formatted_op} ${rt}, ${rs}, {immediate}'
        elif op == 'lui':
            return f'lui   ${rt}, {immediate}'
        elif op == 'lw' or op == 'sw':
            return f'{formatted_op} ${rt}, {immediate}(${rs})'
        else:
            return 'Unsupported instruction'
    else:
        return 'Unsupported instruction'


# 注意这个是从左往右读的，视作字符串
with open('testfile.txt', 'r') as input_file, open('mipscode.asm', 'w') as output_file:
    lines = input_file.readlines()
    if lines[0] == 'v2.0 raw':
        lines.pop(0)
    for line in lines:
        hex_code = '0x' + line
        mips_code = f'{bin(int(hex_code, 16))[2:]:0>32}'
        # print(mips_code)
        instruction = disassemble(mips_code)
        output_file.write(instruction + '\n')
