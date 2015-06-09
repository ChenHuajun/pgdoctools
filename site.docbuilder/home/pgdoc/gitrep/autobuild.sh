#/bin/bash


echo "#### run $0 at" `date "+%F %H:%M:%S"`
cd ~pgdoc/gitrep

./check_github_update.sh
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
  scp build.log postgres:/var/www/html/docs/9.3/build.log
  exit 2
fi

echo "build successed!"

./publish.sh
scp build.log postgres:/var/www/html/docs/9.3/build.log
