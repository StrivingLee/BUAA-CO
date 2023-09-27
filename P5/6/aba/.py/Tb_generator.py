# --------------------------------
# ! /usr/bin/env python

"""
Tb_generator.py -- generate verilog module Testbench
generated bench file like this:

        fifo_sc #(
            .DATA_WIDTH ( 8 ),
            .ADDR_WIDTH ( 8 )
        )
         u_fifo_sc (
            .CLK   ( CLK                     ),
            .RST_N ( RST_N                   ),
            .RD_EN ( RD_EN                   ),
            .WR_EN ( WR_EN                   ),
            .DIN   ( DIN   [DATA_WIDTH-1 :0] ),
            .DOUT  ( DOUT  [DATA_WIDTH-1 :0] ),
            .EMPTY ( EMPTY                   ),
            .FULL  ( FULL                    )
        );

Usage:
      python Tb_generator.py ModuleFileName.v

"""

import re
import sys
import chardet


def delComment(Text):
    """ removed comment """
    single_line_comment = re.compile(r"//(.*)$", re.MULTILINE)
    multi_line_comment = re.compile(r"/\*(.*?)\*/", re.DOTALL)
    Text = multi_line_comment.sub('\n', Text)
    Text = single_line_comment.sub('\n', Text)
    return Text


def delBlock(Text):
    """ removed task and function block """
    Text = re.sub(r'\Wtask\W[\W\w]*?\Wendtask\W', '\n', Text)
    Text = re.sub(r'\Wfunction\W[\W\w]*?\Wendfunction\W', '\n', Text)
    return Text


def findName(inText):
    """ find module name and port list"""
    p = re.search(r'([a-zA-Z_][a-zA-Z_0-9]*)\s*', inText)
    mo_Name = p.group(0).strip()
    return mo_Name


def paraDeclare(inText, portArr):
    """ find parameter declare """
    pat = r'\s' + portArr + r'\s[\w\W]*?[;,)]'
    ParaList = re.findall(pat, inText)

    return ParaList


def portDeclare(inText, portArr):
    """find port declare, Syntax:
       input [ net_type ] [ signed ] [ range ] list_of_port_identifiers

       return list as : (port, [range])
    """
    port_definition = re.compile(
        r'\b' + portArr +
        r''' (\s+(wire|reg)\s+)* (\s*signed\s+)*  (\s*\[.*?:.*?\]\s*)*
        (?P<port_list>.*?)
        (?= \binput\b | \boutput\b | \binout\b | ; | \) )
        ''',
        re.VERBOSE | re.MULTILINE | re.DOTALL
    )

    pList = port_definition.findall(inText)

    t = []
    for ls in pList:
        if len(ls) >= 2:
            t = t + portDic(ls[-2:])
    return t


def portDic(port):
    """delet as : input a =c &d;
        return list as : (port, [range])
    """
    pRe = re.compile(r'(.*?)\s*=.*', re.DOTALL)

    pRange = port[0]
    pList = port[1].split(',')
    pList = [i.strip() for i in pList if i.strip() != '']
    pList = [(pRe.sub(r'\1', p), pRange.strip()) for p in pList]

    return pList


def formatPort(AllPortList, isPortRange=1):
    PortList = AllPortList[0] + AllPortList[1] + AllPortList[2]

    str = ''
    if PortList:
        l1 = max([len(i[0]) for i in PortList]) + 2
        l2 = max([len(i[1]) for i in PortList])
        l3 = max(24, l1)

        strList = []
        for pl in AllPortList:
            if pl:
                str = ',\n'.join([' ' * 4 + '.' + i[0].ljust(l3)
                                  + '( ' + (i[0].ljust(l1) + i[1].ljust(l2))
                                  + ' )' for i in pl])
                strList = strList + [str]

        str = ',\n\n'.join(strList)

    return str


def formatDeclare(PortList, portArr, initial=""):
    str = ''
    if initial != "":
        initial = " = " + initial

    if PortList:
        str = '\n'.join([portArr.ljust(4) + '  ' + (i[1] + min(len(i[1]), 1) * '  '
                                                    + i[0]).ljust(36) + initial + ' ;' for i in PortList])
    return str


def formatPara(ParaList):
    paraDec = ''
    paraDef = ''
    if ParaList:
        s = '\n'.join(ParaList)
        pat = r'([a-zA-Z_][a-zA-Z_0-9]*)\s*=\s*([\w\W]*?)\s*[;,)]'
        p = re.findall(pat, s)

        l1 = max([len(i[0]) for i in p])
        l2 = max([len(i[1]) for i in p])
        paraDec = '\n'.join(['parameter %s = %s;'
                             % (i[0].ljust(l1 + 1), i[1].ljust(l2))
                             for i in p])
        paraDef = '#(\n' + ',\n'.join(['    .' + i[0].ljust(l1 + 1)
                                       + '( ' + i[0].ljust(l1) + ' )' for i in p]) + ')\n'
    else:
        l1 = 6
        l2 = 2
    # # preDec: parameter PERIOD
    # preDec = '\n'.join( ['parameter %s = %s;\n'
    #                          %('PERIOD'.ljust(l1 +1), '10'.ljust(l2 ))])
    # paraDec = preDec + paraDec
    return paraDec, paraDef


def writeTestBench(inputFile, savePath, simTime, cycleTime):
    """ write testbench to file """

    with open(inputFile, 'rb') as f:
        f_info = chardet.detect(f.read())
        f_encoding = f_info['encoding']
    with open(inputFile, encoding=f_encoding) as inFile:
        inText = inFile.read()

    # removed comment,task,function
    inText = delComment(inText)
    inText = delBlock(inText)

    # module ... endmodule  #
    moPos_begin = re.search(r'(\b|^)module\b', inText).end()
    moPos_end = re.search(r'\bendmodule\b', inText).start()
    inText = inText[moPos_begin:moPos_end]

    name = findName(inText)
    paraList = paraDeclare(inText, 'parameter')
    paraDec, paraDef = formatPara(paraList)

    ioPadAttr = ['input', 'output', 'inout']
    input = portDeclare(inText, ioPadAttr[0])
    output = portDeclare(inText, ioPadAttr[1])
    inout = portDeclare(inText, ioPadAttr[2])

    portList = formatPort([input, output, inout])
    input = formatDeclare(input, 'reg', '0')
    output = formatDeclare(output, 'wire')
    inout = formatDeclare(inout, 'wire')

    # write testbench
    targetWriteFile = "{0}\\{1}_tb.v".format(savePath, name)
    with open(targetWriteFile, 'w', encoding='utf-8') as file:
        # print timescale
        timescale = '`timescale  1ns / 1ps\n'
        file.write("//~ `New testbench\n")
        file.write(timescale)

        # print include
        file.write("`include \"{0}.v\"\n\n".format(name))

        # print module_tb's name
        file.write("module tb_%s;\n\n" % name)

        # module_parameter_port_list
        if paraDec != '':
            file.write("// %s Parameters\n%s\n" % (name, paraDec))

        # list_of_port_declarations
        file.write("// %s Inputs\n%s\n\n" % (name, input))
        file.write("// %s Outputs\n%s\n" % (name, output))
        if inout != '':
            file.write("// %s Bidirs\n%s\n\n" % (name, inout))
        file.write("\n")

        # UUT
        file.write("%s %s u_%s (\n%s\n);\n" % (name, paraDef, name, portList))

        # print operation
        operation = '''
initial
begin
    $dumpfile(\"{0}_wave.vcd\");
    $dumpvars;

    clk = 0;
    reset = 1;
    #20
    reset = 0;
    
    // simulation time
    #{1};
    
    $finish;
end

always #{2} clk = ~clk;

'''.format(name, simTime, cycleTime)
        file.write(operation)

        # endmodule
        file.write("endmodule")


# Because the sys.argv is split by spaces, the real address is spliced from sys.argv[1].
# sysArgvLength = len(sys.argv)
# inputFile = sys.argv[1]
# for i in range(2, sysArgvLength):
#     inputFile = inputFile + " " + sys.argv[i]

# call writeTestBench()
# writeTestBench(inputFile)
