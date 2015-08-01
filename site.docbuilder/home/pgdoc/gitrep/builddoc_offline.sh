#!/bin/bash

rm -rf html_out
rm -rf pgdoc-cn/tools/html_out

cd pgdoc-cn

perl tools/encoding_convert.pl
cd build/doc
echo sed -e 's/\$\{updatedate\}/'`date +%Y-%m-%d`'/' -i src/sgml/pgdoccn-notes.sgml|sh
gmake html


