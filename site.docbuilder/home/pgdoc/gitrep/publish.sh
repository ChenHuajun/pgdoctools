#/bin/bash

if [ ! -f html_out/bookindex.html ]
then
 echo "skip publish because html_out is invalid!"
 exit 1
fi

rsync  -r html_out postgres:
if [ ! $? -eq 0 ]
then 
 echo "rsync failed!"
 exit $?
fi

ssh postgres ./publish_html.sh
if [ ! $? -eq 0 ]
then 
 echo "publish_html.sh failed!"
 exit $?
fi

echo "publish successed!"

