#!/bin/bash

INIT_PORT=18000
INIT_PID=9000

case $1 in
start)
 
	for (( a = 1; a < 50; a++ ))
	do
		NEW_PORT=$((INIT_PORT++))
		NEW_PID=$((INIT_PID++))
		echo $NEW_PID
                /usr/sbin/privoxy --pidfile /run/privoxy$a.pid --user privoxy /etc/privoxy$a/config
	done
  ;;
stop)
	killall -15 privoxy
  ;;
esac

