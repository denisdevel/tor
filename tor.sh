#!/bin/bash

INIT_PORT=18000
INIT_PID=9000

case $1 in
start)
 
	for (( a = 1; a < 20; a++ ))
	do
		NEW_PORT=$((INIT_PORT++))
		NEW_PID=$((INIT_PID++))
		echo $NEW_PID
		/usr/bin/tor --runasdaemon 1 --DataDirectory /var/run/tor/tor$NEW_PID -f /etc/tor/torrc --CookieAuthentication 0 --HashedControlPassword "" --ControlPort $NEW_PORT --PidFile /var/run/tor/tor$NEW_PID.pid --SocksPort $NEW_PID
	done
  ;;
stop)
	killall -15 tor
  ;;
esac

