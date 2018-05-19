#!/usr/bin/env bash
#用于iptables开启端口
#./port.sh 端口号
iptables -A INPUT -p tcp --dport $1 -j ACCEPT
iptables -A INPUT -p udp --dport $1 -j ACCEPT
