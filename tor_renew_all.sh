#!/bin/bash

INIT_PORT=18000

for (( a = 1; a < 20; a++ ))
        do
                NEW_PORT=$((INIT_PORT++))
		./tor_renew.sh $NEW_PORT
	done

