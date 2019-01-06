# -*- coding: utf-8 -*-
# @Time    : 2018/10/1 11:28
# @Author  : Tangweeiyang
# @File    : fileStatus.py
import os


def getFileSize(filePath, size=0):
    for root, dirs, files in os.walk(filePath):
        for f in files:
            size += os.path.getsize(os.path.join(root, f))

    return size


# print(getFileSize("."))
for each in os.listdir('.'):
    if os.path.isfile(each):
        print(each,'\t',os.path.getsize(each)//1024**2,'MB')
    else:
        print(each,'\t', getFileSize(each)//1024**2,'MB')

input('')
