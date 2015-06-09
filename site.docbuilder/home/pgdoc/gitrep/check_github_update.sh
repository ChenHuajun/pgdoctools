#/bin/bash

cd pgdoc-cn
git fetch origin 
git status|grep behind 
if [ $? -eq 0 ]
then
  echo "remote git repository had changed!"
  git merge origin/master
  exit 100
fi

echo "remote git repository not changed!"

