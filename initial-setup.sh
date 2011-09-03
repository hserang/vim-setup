#!/bin/sh

MYNAME=vim-setup
HOMEDIR_LINKS=".vim .vimrc"

for linkdir in $HOMEDIR_LINKS; do
    ln -vs ~/$MYNAME/$linkdir ~
done

git submodule init
git submodule update
