#!/bin/bash

# Revision : 1.0
# Date : 2016/10/28
# Author : Legion
# Email : 1931330336@qq.com
# Description:
# License: GPL

# 用户名
MYSQL_USER='zabbix'

# 密码
MYSQL_PASS='123456'

# IP地址
MYSQL_HOST='127.0.0.1'

# 端口
MYSQL_PORT='3306'

# 数据库连接
MYSQL_CONN="/usr/bin/mysql -u${MYSQL_USER} -p${MYSQL_PASS} -h${MYSQL_HOST} -P${MYSQL_PORT}"

# 参数是否正确
if [ $# -ne "1" ];then
    echo "arg error!" 
fi

case $1 in
    CONN)
        ${MYSQL_CONN} -e "SELECT COUNT(*) FROM information_schema.PROCESSLIST WHERE COMMAND='Connect'\G" | grep 'COUNT' | cut -d":" -f 2 
        ;;
    SEND)
        ${MYSQL_CONN} -e "SELECT COUNT(*) FROM information_schema.PROCESSLIST WHERE COMMAND='Sending data'\G" | grep 'COUNT' | cut -d":" -f 2 
        ;;
    TOTAL)
        ${MYSQL_CONN} -e "SELECT COUNT(*) FROM information_schema.PROCESSLIST\G" | grep 'COUNT' | cut -d":" -f 2 
        ;;
    *)
        echo "Usage:$0 ()"
        ;;
esac

