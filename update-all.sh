#!/bin/sh

./collect-tracked.sh

git add .
git commit -m "automated commit"
git push origin master