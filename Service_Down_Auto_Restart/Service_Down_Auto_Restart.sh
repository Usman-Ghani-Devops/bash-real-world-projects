#!/bin/bash

status=$(systemctl is-active nginx)
echo "$status"

if [[ "$status" = "inactive" ]];then
	echo "Starting nginx..."
	systemctl start nginx
fi

