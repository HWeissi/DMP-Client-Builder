#!/bin/sh

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
DATE=`date +%Y-%m-%d`

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull;
    xbuild;
    rm -rf zip/DMPClient;
    mkdir -p zip/DMPClient;
    cp Client/bin/Debug/* zip/DMPClient/;
    zip -r /opt/out/${DATE}.zip zip/DMPClient;
fi

echo "build finished";
