#!/bin/bash

if [ ! $# -eq 1 ]
then
 echo "Usage: $0 pgversion"
 exit -1
fi

PGVERSION=$1

if [ ! -d $PGVERSION ]
then
 echo "Directory $PGVERSION does not exsits"
 exit -1
fi

rm -rf /var/www/html/docs/${PGVERSION}bak
if [ -d /var/www/html/docs/${PGVERSION} ]
then
 mv /var/www/html/docs/${PGVERSION} /var/www/html/docs/${PGVERSION}bak
fi

cp -rf  ${PGVERSION} /var/www/html/docs/${PGVERSION}
rm -rf /var/www/html/docs/${PGVERSION}bak

#更新全文检索索引
cd /var/www/html
php index.php v2 doc_search prepare ${PGVERSION}

