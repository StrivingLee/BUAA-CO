#!/usr/bin/python
# -*- coding: utf-8 -*-

from collections import Counter
import os
import difflib
import argparse
import sys
import filecmp


# read file function
# split the content by line breaks
def read_file(filename):
    try:
        with open(filename, 'r') as fileHandle:
            text = fileHandle.read().splitlines()
        return text
    except IOError as e:
        print("Read file Error:", e)
        sys.exit()


# Compare two files
# output to html file
def diff_file(fileName1, fileName2, resultPath):
    text1_lines = read_file(fileName1)
    text2_lines = read_file(fileName2)

    d = difflib.HtmlDiff()
    result = d.make_file(text1_lines, text2_lines,
                         fileName1, fileName2, context=False)

    # save result in result.html
    with open('{0}\\result.html'.format(resultPath), 'w') as resultFile:
        resultFile.write(result)
    # print(result)


# get the pos of first letter != ' '
def getPos(str):
    i = 0
    while True:
        if not str[i] == ' ':
            return i
        else:
            i = i + 1


def cleanUp(srcFile, finalFile):
    while True:
        tempLine = srcFile.readline()
        if not tempLine:
            break
        else:
            if not tempLine[0] == ' ':
                continue
            else:
                finalFile.write(tempLine[getPos(tempLine):])


def clean_file(filePath1, filePath2):
    srcName1 = "{0}\\{0}_tempOut.txt".format(filePath1)
    srcName2 = "{0}\\{0}_tempOut.txt".format(filePath2)

    srcFile1 = open(srcName1, 'r')
    srcFile2 = open(srcName2, 'r')
    finalFile1 = open("{0}\\{0}_out.txt".format(filePath1), 'w')
    finalFile2 = open("{0}\\{0}_out.txt".format(filePath2), 'w')

    cleanUp(srcFile1, finalFile1)
    srcFile1.close()
    finalFile1.close()
    cleanUp(srcFile2, finalFile2)
    srcFile2.close()
    finalFile2.close()

    if os.path.isfile(srcName1):
        try:
            os.remove(srcName1)
        except BaseException as e:
            print(e)
    if os.path.isfile(srcName2):
        try:
            os.remove(srcName2)
        except BaseException as e:
            print(e)


# execute directly as a script
# if __name__ == '__main__':
def compare(filePath1, filePath2, resultPath):
    # format: -f1 [fileName_1] -f2 [fileName_2]
    parser = argparse.ArgumentParser(description="Pass in two file parameters")
    parser.add_argument('-f1', action='store', dest='filename1', required=True)
    parser.add_argument('-f2', action='store', dest='filename2', required=True)

    # clean two files
    clean_file(filePath1, filePath2)
    print("Successful Clean!")  # prompt

    filename1 = "{0}\\{0}_out.txt".format(filePath1)  # reference file
    filename2 = "{0}\\{0}_out.txt".format(filePath2)  # your CPU's file

    # to make a comparison
    print("Now going to make comparison between two files:")  # prompt
    diff_file(filename1, filename2, resultPath)
