#!/bin/bash
# Last Update:2016-11-04

# 参数是否正确
if [ $# -ne "1" ];then 
    echo "arg error!" 
fi 


case $1 in 
    gitlab-workhorse)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    logrotate)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    nginx)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    postgresql)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    redis)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    sidekiq)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    unicorn)
        /bin/sudo /bin/gitlab-ctl status | grep $1 | cut -d':' -f1 | grep -c ^run
        ;;
    *)
        echo "Usage $0 (gitlab-workhorse|logrotate|nginx|postgresql|redis|sidekiq|unicorn)"
esac

