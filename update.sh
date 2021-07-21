#!/bin/bash
#******************************************************************************
# File Name: update.sh
# Author: Chuncheng Wei
# Mail: weicc1989@gmail.com
# Created Time : Tue 16 Jan 2018 05:37:16 PM DST
# Last Modified: Mon Sep  2 13:09:13 2019
#******************************************************************************

# input
msg="temp update"
if [ $# != 0 ]; then
    msg="update: $*"
fi

# commit
git add ./
git commit -a -m "$msg"
git push
