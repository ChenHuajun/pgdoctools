# -*- coding: utf-8 -*-  
# sgml文件差分
# 统计差分行数的算法比较粗糙，但不会遗漏变更的文件。具体如下：
# 1. 当源和目标的2个同名文件都存在且内容不相同时，计算差异行数 
# 2. 以行为单位进行比较，忽视行所在的位置。因此，如果2个文件仅行的次序不同，差分结果为：add和del都为0
# 3. 如果相同内容的行大于1行，且源和目标中该内容的行数目不同，相差的行数视为add或del。
# 示例：
# 源文件
# 1
# 2
# 1
# 目标文件
# 3
# 1
# 1
# 1
# 2
# 输出结果
# file    state   add     del     same
# a.sgml  MOD     2       0       3
#
# 使用：python diffcount.py -s ${源sgml文件目录} -t ${目标sgml文件目录}
#       示例:python diffcount.py  -s postgresql-13.1\\doc\\src\\sgml -t postgresql-14.1\\doc\\src\\sgml

import os
import codecs
import sys
import getopt

sourceDir = r"postgresql-13.1\\doc\\src\\sgml"
targetDir = r"postgresql-14.1\\doc\\src\\sgml"
sourceEncoding=r"UTF-8"
targetEncoding=r"UTF-8"


deletefiles=[]
modifiedFiles={}

def count_line(file):
    count = 0
    with open(file, "r", encoding=sourceEncoding) as f:
        line=f.readline()
        while line:
            count+=1
            line=f.readline()
    
    return count

def process_src(sourceFile, targetFile):
    if os.path.isdir(sourceFile):
        # process all files in this dir
        for f in os.listdir(sourceFile):
            sourceF = os.path.join(sourceFile, f)
            targetF = os.path.join(targetFile, f)
            process_src(sourceF, targetF)
    elif(sourceFile.endswith(".sgml")):
        if not os.path.exists(targetFile):
            modifiedFiles[targetFile]={
            "state":"DEL",
            "add":0,
            "del":count_line(sourceFile),
            "same":0
            }
            return
        srcCodeCount={}
        fsrc=codecs.open(sourceFile, "r", encoding=sourceEncoding)
        ftarget=codecs.open(targetFile, "r", encoding=sourceEncoding)
        srcLines = fsrc.readlines()
        targetLines = ftarget.readlines()
        if srcLines == targetLines:
            modifiedFiles[targetFile]={
            "state":"SAME",
            "add":0,
            "del":0,
            "same":count_line(sourceFile)
            }
            return

        for line in srcLines:
            line = line.strip('\n').strip('\r')
            count = srcCodeCount.get(line)
            if count:
                count += 1
            else:
                count = 1
            srcCodeCount[line] = count

        count_add=0
        count_del=0
        count_same=0
        for line in targetLines:
            line = line.strip('\n').strip('\r')
            count = srcCodeCount.get(line)
            if count and count > 0:
                srcCodeCount[line] = count - 1
                count_same+=1
            else:
                count_add+=1
        for line in srcCodeCount:
            count_del += srcCodeCount[line]
        modifiedFiles[targetFile]={
        "state":"MOD",
        "add":count_add,
        "del":count_del,
        "same":count_same
        }
        
        fsrc.close()
        ftarget.close()

def process_target(targetFile):
    if os.path.isdir(targetFile):
        # process all files in this dir
        for f in os.listdir(targetFile):
            targetF = os.path.join(targetFile, f)
            process_target(targetF)
    elif(targetFile.endswith(".sgml")):
        fileDiff = modifiedFiles.get(targetFile)
        if fileDiff is None:
            modifiedFiles[targetFile]={
            "state":"NEW",
            "add":count_line(targetFile),
            "del":0,
            "same":0
            }


if __name__ == "__main__":
    opts, args = getopt.getopt(sys.argv[1:], "hs:t:")
    src_file_dir=""
    target_file_dir=""
    for op, value in opts:
        if op == "-s":
            src_file_dir = value
        elif op == "-t":
            target_file_dir = value
        elif op == "-h":
            usage()
            sys.exit()
    process_src(src_file_dir, target_file_dir)
    process_target(target_file_dir)
    print("file","state","add","del","same",sep='\t')
    for f in sorted(modifiedFiles.keys()):
        d=modifiedFiles[f]
        if d["state"] != "SAME":
            print(f[len(target_file_dir)+1:],d["state"],d["add"],d["del"],d["same"],sep='\t')
