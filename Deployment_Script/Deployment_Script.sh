#!/bin/bash

read  -r -p "Enter the path of your app: " path

cd "$path" || {echo "Invalid Path"; exit 1;}

echo "Pulling the latest code"

git pull origin master

if [[ ! $? -eq 0 ]];
then 
	echo "Unable to pull the code Solve the git errors "
fi

read -p "Enter the Serivce: " service

echo "Restarting the Service"

sudo systemctl restart "$service"

read -p "Enter the Port Number: " port

if ss -tulnp4 | grep -q ":$port"; then 
	echo "Deployment Success"
	exit 0
else
	echo "Deployment Fails Roll Back"
fi

git reset --hard HEAD~1

sudo systemctl restart "$service"

exit 1 

