#!/bin/bash

workdir=`pwd`
htmlfilename=PostgreSQL9.3.1-CN-HTML-v1.1

rm -rf postgres-A4.tex-pdf.gz ${htmlfilename}.tar.gz ${htmlfilename}

#create htmls
cp -rf gitrep/html_out ${htmlfilename}
tar cfz ${htmlfilename}.tar.gz ${htmlfilename}

#create postgres-A4.tex-pdf
cd gitrep/pgdoc-cn/build/doc/src/sgml/
make postgres-A4.tex-pdf
cd $workdir
python3 preprocess_tex-pdf.py
gzip postgres-A4.tex-pdf