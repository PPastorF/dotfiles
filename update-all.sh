#!/bin/sh

echo $PWD

./collect-tracked.sh

git add .
git commit -m "automated commit"
git push origin master