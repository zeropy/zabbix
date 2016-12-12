#!/bin/bash
#Last update:2016-12-12
#用于zabbix远程命令，slave延迟时发送slave信息

#mysql user
MYSQL_USER='root'

#mysql password
MYSQL_PASS='yourpassword'

#mysql host
MYSQL_HOST='localhost'

#mysql port
MYSQL_PORT='3306'

MYSQL_CONN="/usr/bin/mysql -u ${MYSQL_USER} -h ${MYSQL_HOST} -P ${MYSQL_PORT} -p${MYSQL_PASS}"
slave_info() {
    echo '###show slave status###'
    $MYSQL_CONN -e "show slave status\G"
    echo 
    echo '###show processlist###'
    $MYSQL_CONN -e "show processlist"
}

slave_info > /usr/local/zabbix/scripts/slave_info
cat /usr/local/zabbix/scripts/slave_info | mail -s 'slave info' your_mail
