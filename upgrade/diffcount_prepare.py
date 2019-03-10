# -*- coding: utf-8 -*-  
# sgml文件差分预处理
# 1. sgml编码从UTF8转到GBK
# 2. 所有sgml文件扩展名为xml,为了支持diffcount统计sgml差异
#
# 使用：diffcount_prepare ${输入sgml文件目录名} ${输出xml文件目录名}
#       示例:diffcount_prepare  postgresql-10.1\\doc\\src\\sgml postgresql-10.1_sgml

import os
import codecs
import sys
import getopt

sourceDir = r"postgresql-10.1\\doc\\src\\sgml"
targetDir = r"postgresql-10.1_sgml"
sourceEncoding=r"UTF-8"
targetEncoding=r"UTF-8"

def process(sourceFile, targetFile):
	print(sourceFile)
	if os.path.isdir(sourceFile):
		# process all files in this dir
		if not os.path.exists(targetFile):
			os.makedirs(targetFile)
		for f in os.listdir(sourceFile):
			sourceF = os.path.join(sourceFile, f)
			targetF = os.path.join(targetFile, f)
			process(sourceF, targetF)
	elif(sourceFile.endswith(".sgml")):
		# encoding convert
		fin=codecs.open(sourceFile, "r", encoding=sourceEncoding)
		fout=codecs.open(targetFile + ".xml", "w", encoding=targetEncoding)
		fout.write(fin.read())
		fin.close()
		fout.close()
	#else:
		# skip file
		# open(targetFile, "wb").write(open(sourceFile, "rb").read())

if __name__ == "__main__":
	opts, args = getopt.getopt(sys.argv[1:], "hi:o:")
	input_file_dir=""
	output_file_dir=""
	for op, value in opts:
		if op == "-i":
			input_file_dir = value
		elif op == "-o":
			output_file_dir = value
		elif op == "-h":
			usage()
			sys.exit()
	process(input_file_dir,output_file_dir)
