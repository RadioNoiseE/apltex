#!/bin/sh
set -e

if [ -f LOCK ]; then
    echo ":: directory locked, cleanup first"
    exit 0
fi

wkspc=`pwd`
parnt=$wkspc/..
fntds=$parnt/texmf/fonts

if [ -d $fntds ]; then
    cp -r tfm $fntds
    cp -r type1 $fntds
    mkdir $fntds/map && cp luatex.map $fntds/map
fi

cd $wkspc
touch LOCK
