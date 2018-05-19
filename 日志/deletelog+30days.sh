#!/usr/bin/env bash
#用于删除本目录下存在大于30天的日志,强制删除
#./deletelog+30days.sh
find . -mtime +30 -name "*.log" -exec rm -f {} \;


