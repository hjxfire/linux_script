#!/bin/bash
# author: hjxfire
# Copyright (C) 2018 hjxfire <hjxfire@outlook.com>
# https://github.com/hjxfire/linux_script
# 用法:sh ip.sh domain

ADDR=$1
TMPSTR=`ping ${ADDR} -c 1 | grep ${ADDR} | head -n 1`
echo ${TMPSTR} | awk -F'[()]' '{print $2}'