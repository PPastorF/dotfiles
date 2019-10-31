#!/bin/sh

./collect-tracker.sh

git add .
git commit -m "automated commit"
git push origin master