#!/bin/bash

rm -rf html_out
rm -rf pgdoc-cn/tools/html_out

cd pgdoc-cn

perl tools/encoding_convert.pl
cd build/doc
gmake html

cd ../../tools
python3 add_edit_link.py >/dev/null
mv html_out ../../

