#!/bin/bash
# author: hjxfire
# Copyright (C) 2018 hjxfire <hjxfire@outlook.com>
# https://github.com/hjxfire/linux_script
# 用法:sh ip_fromFile.sh filename

while read line
do
    TMPSTR=`ping ${line} -c 1 | grep ${line} | head -n 1`
    echo "${line} \c"
    echo ${TMPSTR} | awk -F'[()]' '{print $2}'
done < $1