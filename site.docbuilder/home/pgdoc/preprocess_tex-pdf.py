#1 convert character encoding from GBK to UTF8
#2 convert "\Character{XXXXX}" to UTF8 characters
#3 convert "牘" to "\Entity{copy}"
#4 convert "燶" to "\"


import sys
import os
import re
sys.path.append(".") 

patternReplace1=re.compile(r'\\Character\{([0-9]+)\}')

sourceFile = r"gitrep/pgdoc-cn/build/doc/src/sgml/postgres-A4.tex-pdf"
targetFile = r"postgres-A4.tex-pdf"
sourceEncoding=r"GBK"
targetEncoding=r"UTF-8"

def toChar(m):
	return chr(int(m.group(1)))

def process(sourceFile, targetFile):
	# encoding convert
	fin=open(sourceFile, "r", encoding=sourceEncoding)
	fout=open(targetFile, "w", encoding=targetEncoding)
	content=fin.read()
	content=content.replace('牘','\\Entity{copy}')
	content=content.replace('燶','\\')
	content=patternReplace1.sub(toChar,content)
	fout.write(content)
	fin.close()
	fout.close()


if __name__ == "__main__":
	process(sourceFile,targetFile)
