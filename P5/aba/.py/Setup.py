import os
import Tb_generator
import Compare
import webbrowser

# ---------------------------SETUP----------------------------
testPath = "test_CPU"  # better not change
refPath = "ref_CPU"  # better not change
resultPath = "Result"  # better not change

testCode = "code.txt"  # machine code file for testing, could be changed
simTime = 13000  # simTime, could be changed
cycleTime = 2  # cycleTime, could be changed
# ---------------------------SETUP----------------------------


def list_vFiles(path: str, extension: str):
    """
    iterate through all files in the path directory whose names end with extension, and return a list of file names
    example: list_files('src', '.v')
    """
    result = []
    for path, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(extension) and not file == 'mips.v' and not file.endswith("_tb.v"):
                result.append(os.path.join(file))
    return result
    # print(list_vFiles('src', '.v'))  # check list


def copyFile(srcFile, dstPath):
    if not os.path.exists(srcFile):
        print("{0} not exist!".format(srcFile))
        os.system("pause")
    else:
        src = open(srcFile, "r")
        cpy = open("{0}\\code.txt".format(dstPath), "w")
        while True:
            tempLine = src.readline()
            if not tempLine:
                break
            else:
                cpy.write(tempLine)
        cpy.close()
        src.close()


def writeCompileCommand(writePath, bat):
    bat.write("cd {0}\n".format(writePath))
    compileCommand = "iverilog -o mips_tb.v.out mips_tb.v " + " ".join(list_vFiles(writePath, '.v'))
    bat.write(compileCommand + "\n")  # remember to insert '\n'
    bat.write("vvp mips_tb.v.out > {0}_tempOut.txt\n".format(writePath))
    bat.write("cd ..\n")  # return to the previous level of the directory


# execute directly as a script
if __name__ == '__main__':
    parentPath = os.path.realpath(os.path.join(os.path.dirname("__file__"), '.'))

    # generate testbench and .vcd files
    realRefPath = parentPath + "\\{0}".format(refPath)
    realTestPath = parentPath + "\\{0}".format(testPath)
    referenceFile = realRefPath + "\\mips.v"
    testFile = realTestPath + "\\mips.v"
    Tb_generator.writeTestBench(referenceFile, realRefPath, simTime, cycleTime)
    # Tb_generator.writeTestBench(testFile, realTestPath, simTime, cycleTime)

    # copy the testcode file
    copyFile(testCode, realRefPath)
    copyFile(testCode, realTestPath)

    # write compileFile
    bat = open("Compile.bat", "w")

    # you need to have a testbench file named mips_tb.v first [call writebench()]
    writeCompileCommand(refPath, bat)
    writeCompileCommand(testPath, bat)

    # close the bat file
    bat.close()

    # call bat
    os.system("call Compile.bat")

    # compare two files
    Compare.compare(refPath, testPath, resultPath)

    # open the resultFile
    # os.system("fc {0}\\{0}_out.txt {1}\\{1}_out.txt".format(refPath, testPath))
    webbrowser.open("{0}\\result.html".format(resultPath))
