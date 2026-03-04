#!/bin/bash

path='/var/log/auth.log'

echo "Checking Failed SSH login attempts"

sudo grep "Failed password" "$path" | awk '{print $(NF-3)}' | sort | uniq -c | while read count ip
do 
	if [[ "$count" -gt 5 ]];then
		echo "Blocking "$ip" Attempts "$count"
		sudo iptables -A INPUT -s "$ip" -j DROP
	fi
done

echo "Done"
