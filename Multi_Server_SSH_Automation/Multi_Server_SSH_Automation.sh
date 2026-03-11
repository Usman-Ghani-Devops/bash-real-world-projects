#! /bin/bash

set -euo pipefail
servers=("server1" "server2" "server3" "server4" "server5")

for server in "${servers[@]}";
do
	echo "Connecting to the $server: " 

	result=$(ssh user@"$server" "uptime" 2>/dev/null || echo "Connection Failed")

	echo "$server : $result" >> report
done

echo "Report save in Report file"
