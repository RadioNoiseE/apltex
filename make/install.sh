#!/bin/sh

realpath()
{
    oldpath=`pwd`
    if ! cd $1 > /dev/null 2>&1; then
        cd ${1##*/} > /dev/null 2>&1
        echo $( pwd -P )/${1%/*}
    else
        pwd -P
    fi
    cd $oldpath > /dev/null 2>&1
}

cat<<'EOF'
=======================================================
               Root Privileges Required
=======================================================

This script will install aplTeX to `/usr/local/lib'
and create the `luatex' symlink in `/usr/local/bin'

The commands executed are exposed using `set -evx'.
EOF

set -evx

sleep 6

cd "$(realpath $(dirname "$0"))/.."

sudo cp -r texmf /usr/local/lib
sudo ln -sf /usr/local/lib/texmf/web2c/luahbtex /usr/local/bin/luatex
