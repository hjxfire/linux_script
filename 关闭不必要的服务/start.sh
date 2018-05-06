#!/usr/bin/env bash
#该脚本会在当前路径下生成一个名为disable_service.sh的脚本,包括所有当前已启动的服务,并且写好了关闭服务,禁止开机自启的命令
#执行disable_service.sh脚本将会使其中所列的所有服务关闭并禁止开机自启
systemctl list-unit-files | grep enabled | grep .service | awk '{print "systemctl stop "$1" & systemctl disable "$1""}' > disable_service.sh