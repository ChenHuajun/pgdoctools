#/bin/bash

echo "#### run $0 at" `date "+%F %H:%M:%S"`
cd ~pgdoc/gitrep

echo "#### build 9.3"
./autobuildone.sh 9.3

echo "#### build 9.4"
./autobuildone.sh 9.4
