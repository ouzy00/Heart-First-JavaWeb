#!/bin/sh
git pull --rebase
git add -A
git commit -am "update `date`"
git push
if which gitbook > /dev/null; then
    cd source
    gitbook build
    cd _book
    cp -R * ../../../heart-first-javaweb-gitbook
    cd ../../../heart-first-javaweb-gitbook/
    git add -A
    git commit -am "update `date`"
    git push --force
else
    echo "Gitbook not installed."
fi
