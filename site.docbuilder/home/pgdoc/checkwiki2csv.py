import os
import re

patternRow1=re.compile(r'.*<em>([^<]+)</em>.*<strong>([^<]+)</strong>.*共([0-9]+)行[ ]+<strong>([^<]+)</strong>.*')
patternRow2=re.compile(r'.*翻译By:(.*)[ ]+校对预定By:(.*)[ ]+校对完成By:(.*)</p>.*')
patternUrl=re.compile(r'<a [^>]+>([^<]*)</a>')

count=0
step=1
no=1
f=open("check9.3.html","r",encoding='UTF-8')
for line in f:
        #print(line)
        if step == 1:
                match=patternRow1.match(line)
                if match:
                        sgml=match.group(1)
                        title=match.group(2)
                        lines=match.group(3)
                        status=match.group(4)
                        step=2
                        continue
        elif step == 2:
                 match=patternRow2.match(line)
                 if match:
                        count=count+1
                        print(count,sgml,title,lines,status,match.group(1),patternUrl.sub(r'\1',match.group(2)),patternUrl.sub(r'\1',match.group(3)),sep=',')
                        step=1

