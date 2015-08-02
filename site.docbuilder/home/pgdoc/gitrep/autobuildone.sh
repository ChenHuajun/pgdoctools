#/bin/bash

if [ ! $# -eq 1 ]
then
 echo "Usage: $0 pgversion"
 exit -1
fi

PGVERSION=$1

./check_github_update.sh $PGVERSION
if [ ! $? -eq 100 ]
then
# no update from github
  exit 1
fi

echo "#### build pgdoc at" `date "+%F %H:%M:%S"` >build.log
./builddoc.sh >>build.log 2>&1
if [ ! $? -eq 0 ]
then
 echo "build failed!" 
  scp build.log postgres:/var/www/html/docs/${PGVERSION}/build.log
  exit 2
fi

echo "build successed!"

./publish.sh $PGVERSION
scp build.log postgres:/var/www/html/docs/${PGVERSION}/build.log