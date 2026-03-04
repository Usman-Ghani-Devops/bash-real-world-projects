**Project Overview**

This project is a Bash-based security automation script that monitors failed SSH login attempts and automatically blocks suspicious IP addresses.  
If more than 5 failed login attempts are detected from the same IP address in:  
/var/log/auth.log  
The script will automatically block that IP using iptables.  
This simulates a real-world security hardening scenario commonly used in DevOps and System Administration.  

**Problem Statement**

Brute-force SSH attacks are very common on Linux servers.  
Attackers continuously try:  
1. Different usernames  
2. Different passwords  
3. Multiple login attempts  
If not controlled, this can lead to:  
1. Unauthorized access  
2. Server compromise  
3. Resource exhaustion  

**Solution**

This script:  
1. Reads /var/log/auth.log  
2. Filters Failed password entries  
3. Extracts source IP addresses  
4. Counts number of failed attempts per IP  
5. If attempts > 5 → Block IPg iptables

**How It Works**

**Step 1 – Search Failed Logins**  

grep "Failed password" /var/log/auth.log   

**Step 2 – Extract IP Address**

awk '{print $(NF-3)}'  

**Step 3 – Count Attempts**

sort | uniq -c

**Step 4 – Block Suspicious IP**

iptables -A INPUT -s <IP> -j DROP

**Script Code**
#!/bin/bash  

path='/var/log/auth.log'  

echo "Checking Failed SSH login attempts"  

sudo grep "Failed password" "$path" | awk '{print $(NF-3)}' | sort | uniq -c | while read count ip  
do   
	if [[ "$count" -gt 5 ]];then  
		echo "Blocking $ip Attempts $count"  
		sudo iptables -A INPUT -s "$ip" -j DROP  
	fi  
done  

echo "Done"  

**Requirements**

1. Linux system (Ubuntu/Debian)  
2. Root or sudo privileges  
3. SSH service enabled  
4. iptables installed  


**🚀 How to Run**

**Give Execution Permission**

chmod +x failed_login_blocker.sh  

**Run Script**

sudo ./failed_login_blocker.sh  

**Example Output**

Checking Failed SSH login attempts  
Blocking 192.168.1.100 Attempts 8  
Blocking 10.0.0.23 Attempts 6   
Done  

**Real-World Use Case**

In production environments, this type of automation is used for: 
1. Server hardening  
2. Security monitoring  
3. Intrusion prevention  
4. DevOps auto-healing system  

**Important Notes**  

This script blocks IPs permanently (until manually removed).  
It does not whitelist trusted IPs.  
It does not persist rules after reboot (unless saved manually).    
Be careful not to block your own IP.  

**Learning Outcomes**

By building this project, you understand:  

Log monitoring  
Bash scripting  
awk & text processing  
Linux security basics  
Firewall management  
DevOps automation mindset  

**Author**

Usman Ghani  
DevOps & Linux Enthusiast
