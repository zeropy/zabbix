#!/bin/bash

# Revision : 1.0
# Date : 2016/10/27
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
    IO)
        $MYSQL_CONN -e 'show slave status\G' | grep 'Slave_IO_Running' | grep -c 'Yes'
        ;;
    SQL)
        $MYSQL_CONN -e 'show slave status\G' | grep 'Slave_SQL_Running' | grep -c 'Yes'
        ;;
    *)
        echo "Usage:$0 (IO|SQL)"
        ;;
esac

