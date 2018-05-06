#!/usr/bin/env bash
#该脚本会将start.sh生成的disable_service.sh转换成enable_service,用以开启并开机自启服务
cat disable_service.sh | awk '{print "systemctl start "$3" & systemctl enable "$3""}' > enable_service.sh