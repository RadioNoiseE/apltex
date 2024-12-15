#!/bin/sh
set -e

if [ -f LOCK ]; then
    echo ":: directory locked, cleanup first"
    exit 0
fi

wkspc=`pwd`
parnt=$wkspc/..
webtc=$parnt/texmf/web2c

[ -d $webtc ] && cp texmf.cnf $webtc

cd $wkspc
touch LOCK
