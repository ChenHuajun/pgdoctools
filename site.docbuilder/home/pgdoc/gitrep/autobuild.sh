#/bin/bash

echo "#### run $0 at" `date "+%F %H:%M:%S"`
cd ~pgdoc/gitrep

# echo "#### build 9.3"
# ./autobuildone.sh 9.3

# echo "#### build 9.4"
# ./autobuildone.sh 9.4

echo "#### build 10"
./autobuildone.sh 10

echo "#### build 11"
./autobuildone.sh 11

echo "#### build 12"
./autobuildone.sh 12
