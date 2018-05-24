#!/bin/bash

INIT_PORT=18000
INIT_PID=9000

case $1 in
start)
 
	for (( a = 1; a < 25; a++ ))
	do
		NEW_PORT=$((INIT_PORT++))
		NEW_PID=$((INIT_PID++))
		echo "PORT=${NEW_PORT}" > /etc/systemd/system/tor.d/env.conf
		cat /etc/systemd/system/tor.d/env.conf
		echo $NEW_PID
               /usr/bin/systemctl start tor@$NEW_PID.service
		sleep 5
	done
  ;;
stop)
	for (( a = 1; a < 25; a++ ))
	do
		/usr/bin/systemctl stop tor@$((INIT_PID++)).service
	done
  ;;
esac

