#!/usr/local/python34/bin/python3
# -*- coding: UTF-8 -*-
#功能:转换html的字符编码为UTF8

import sys
import os
import re
sys.path.append(".") 

if len(sys.argv) < 1:
    print("Usage: convert_html_encoding_utf8.py sgml_dir")
    sys.exit()

sgmlDir=sys.argv[1]
htmlDir=os.path.join(sgmlDir,"html")
htmlOutputDir=os.path.join("html_utf8")

if not os.path.exists(htmlOutputDir):
	os.mkdir(htmlOutputDir)
	
# copy stylesheet.css
open(os.path.join(htmlOutputDir,"stylesheet.css"), "wb").write(open(os.path.join(sgmlDir,"stylesheet.css"), "rb").read())

def process(file):
	filename=os.path.basename(file)
	fin=open(file,"r",encoding='GBK')
	fout=open(os.path.join(htmlOutputDir,filename),"w",encoding='UTF-8')
	content=fin.read()
	content=content.replace('CONTENT="text/html; charset=gbk"','CONTENT="text/html; charset=utf-8"')
	print(filename)
	print(content,file=fout)
	fin.close()
	fout.close()
	
for file in os.listdir(htmlDir):
        if file.endswith(".html"):
                process(os.path.join(htmlDir,file))
