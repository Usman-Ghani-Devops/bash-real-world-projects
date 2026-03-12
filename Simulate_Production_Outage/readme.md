# Nginx Production Outage Auto-Recovery Script

## Overview

This project simulates a **real-world production outage scenario** and provides a **Bash automation script** that diagnoses and attempts to fix common infrastructure issues affecting an Nginx web server.

In real production environments, services may fail due to multiple reasons such as service crashes, port conflicts, firewall rules, disk exhaustion, or permission problems.
This script automatically checks these conditions and performs corrective actions when possible.

The goal of this project is to demonstrate **practical DevOps troubleshooting and automation using Bash and Linux system tools**.

---

# Problem Scenario

A web server becomes unavailable in production.

Users cannot access the website running on **Nginx**.

Your responsibility as a **DevOps / System Engineer** is to quickly diagnose and resolve the issue.

The script simulates debugging the following common production problems:

* Service not running
* Port not listening
* Firewall blocking traffic
* Disk space full
* Permission denied

---

# Features

The script automatically performs the following checks and fixes:

### 1. Service Status Check

Verifies whether the **Nginx service is running**.

If the service is stopped, the script will automatically start it.

What it does:

* Uses `systemctl` to check service status
* Starts Nginx if it is down

Example output

```
Checking whether the nginx is start or not...
nginx is down. Starting now...
```

---

# Port Availability Check

Even if a service is running, it may not be **listening on the expected port**.

This script verifies that **port 80** is actively listening.

If the port is not listening:

* The script restarts Nginx
* Checks again if the port becomes active

Tools used:

* `ss` for socket statistics
* `grep` for pattern matching

Example output

```
Now checking port..
Not Listen. Now Listening...
Listen
```

---

# Firewall Verification

A firewall may block incoming HTTP traffic even if the server is running properly.

The script checks the **UFW firewall status**.

Cases handled:

### Case 1 — Firewall disabled

The script enables it.

### Case 2 — HTTP port not allowed

The script allows **port 80/tcp**.

Commands used:

```
ufw status
ufw enable
ufw allow 80/tcp
```

Example output

```
Now Checking Firewall...
Firewall is currently DISABLED. Enabling now...
Firewall is Ok
```

---

# Disk Space Monitoring

Disk exhaustion is a **common cause of production outages**.

If the root filesystem becomes full:

* Logs cannot be written
* Services may crash
* Applications may stop responding

The script checks disk usage using:

```
df /
```

If usage exceeds **90%**, it automatically removes old log files from:

```
/var/log/*.log
```

Example output

```
Checking Disk Space...
WARNING: Disk space is critically low at 95%!
Removing...
```

---

# Permission Verification

Incorrect file permissions can prevent Nginx from starting properly.

The script checks read permission for the main configuration file:

```
/etc/nginx/nginx.conf
```

If permissions are incorrect:

* The script fixes them
* Restarts Nginx

Example output

```
Checking nginx permissions...
Permission problem detected!
```

---

# Script Workflow

The script performs checks in the following order:

```
Start
 │
 │
Check Nginx Service
 │
 ├─ If stopped → Start service
 │
Check Port 80 Listening
 │
 ├─ If not listening → Restart Nginx
 │
Check Firewall Status
 │
 ├─ Enable firewall if disabled
 ├─ Allow port 80 if blocked
 │
Check Disk Usage
 │
 ├─ If >90% → Clean logs
 │
Check File Permissions
 │
 ├─ Fix nginx.conf permissions
 │
Production Check Completed
```

---

# Technologies Used

* Bash scripting
* Linux system administration
* Nginx
* UFW firewall
* Systemd
* Linux networking tools

Commands used in the script:

```
systemctl
ss
grep
awk
sed
df
ufw
chmod
rm
```

---

# Requirements

The script requires:

* Linux server (Ubuntu / Debian recommended)
* Nginx installed
* UFW firewall installed
* Root or sudo privileges

---

# How to Run

Clone the repository

```
git clone https://github.com/yourusername/nginx-production-check.git
```

Navigate to the project directory

```
cd nginx-production-check
```

Make the script executable

```
chmod +x production_check.sh
```

Run the script

```
./production_check.sh
```

---

# Example Use Case

Imagine a real incident:

A website suddenly becomes unavailable.

Possible causes:

* Nginx crashed
* Firewall blocked traffic
* Port 80 stopped listening
* Disk space reached 100%
* Configuration file permissions changed

Instead of manually checking each component, this script **automatically diagnoses and attempts recovery**.

---

# Learning Outcomes

This project demonstrates practical DevOps skills:

* Linux service management
* Network port diagnostics
* Firewall configuration
* Disk monitoring
* File permission troubleshooting
* Production automation using Bash


---

# Author

Usman Ghani

DevOps Enthusiast | Linux | Bash | Networking | Automation

---

# License

This project is open source and available under the MIT License.
