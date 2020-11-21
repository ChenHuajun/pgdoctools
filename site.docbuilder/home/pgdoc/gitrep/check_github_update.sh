#/bin/bash

if [ ! $# -eq 1 ]
then
 echo "Usage: $0 pgversion"
 exit -1
fi

PGVERSION=$1

cd pgdoc-cn
git fetch origin
if [ "$PGVERSION" = "13" ]
then
  BRANCH="master"
else
  BRANCH="$PGVERSION"
fi

git checkout $BRANCH
if [ ! $? -eq 0 ]
then
  exit 1
fi

git status|grep behind 
if [ $? -eq 0 ]
then
  echo "remote git repository had changed!"
  git merge origin/$BRANCH
  exit 100
fi

echo "remote git repository not changed!"

