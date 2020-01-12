#/bin/bash

if [ $# -lt 1 ]
then
 echo "Usage: $0 pgversion [-f]"
 exit -1
fi

PGVERSION=$1

./check_github_update.sh $PGVERSION
if [ $? -ne 100 -a "$2" != "-f" ]
then
# no update from github
  exit 1
fi

echo "#### build pgdoc at" `date "+%F %H:%M:%S"` >build.log
./builddoc.sh $PGVERSION >>build.log 2>&1
if [ ! $? -eq 0 ]
then
 echo "build failed!" 
  scp build.log postgres.cn:/var/www/html/docs/${PGVERSION}/build.log
  exit 2
fi

echo "build successed!"

./publish.sh $PGVERSION
scp build.log postgres.cn:/var/www/html/docs/${PGVERSION}/build.log
