#/bin/bash

if [ ! $# -eq 1 ]
then
 echo "Usage: $0 pgversion"
 exit -1
fi

PGVERSION=$1

if [ ! -f html_out/bookindex.html ]
then
 echo "skip publish because html_out is invalid!"
 exit 1
fi

rsync --delete -azr html_out/ postgres.cn:${PGVERSION}/
if [ ! $? -eq 0 ]
then 
 echo "rsync failed!"
 exit $?
fi

ssh postgres.cn ./publish_html.sh $PGVERSION
if [ ! $? -eq 0 ]
then 
 echo "publish_html.sh failed!"
 exit $?
fi

echo "publish successed!"

