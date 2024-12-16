#!/bin/sh
set -e

if [ -f LOCK ]; then
    echo ":: directory locked, cleanup first"
    exit 0
fi

wkspc=`pwd`
parnt=$wkspc/..
dumpr=$parnt/texmf/web2c/

export PATH=$dumpr:$PATH

[ -d $parnt/texmf/web2c ] && luahbtex -ini luatex.ini && cp luatex.fmt $parnt/texmf/web2c

cd $wkspc
touch LOCK
