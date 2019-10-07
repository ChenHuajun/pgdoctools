#!/bin/bash

set -e

if [ ! $# -eq 1 ]
then
 echo "Usage: $0 pgversion"
 exit -1
fi

PGVERSION=$1

if [ ! -d ../postgresql-${PGVERSION} ]
then
 echo "could not find ../../postgresql-${PGVERSION}"
 exit -1
fi

rm -f ./pgdoc-cn/build
ln -sf ../../postgresql-${PGVERSION} ./pgdoc-cn/build
cp -rf ./pgdoc-cn/postgresql/doc/src/sgml/* ./pgdoc-cn/build/doc/src/sgml/

rm -rf html_out
rm -rf pgdoc-cn/tools/html_out

cd pgdoc-cn

if [[ "9.3 9.4 9.5 9.6" =~ "$PGVERSION" ]]
then
 perl tools/encoding_convert.pl
fi
cd build/doc
echo sed -e 's/\$\{updatedate\}/'`date +%Y-%m-%d`'/' -i src/sgml/pgdoccn-notes.sgml|sh
gmake html

cd ../../tools
python3 add_edit_link.py >/dev/null
mv html_out ../../

