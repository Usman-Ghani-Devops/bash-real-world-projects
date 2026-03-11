# Multi-Server SSH Automation

A Bash automation script that connects to multiple remote servers using SSH, executes a command, collects the results, and saves them into a centralized report file.

This project demonstrates a **real-world infrastructure automation task** commonly used by **DevOps Engineers, System Administrators, and Cloud Engineers** for managing multiple servers efficiently.

---

## 📌 Project Overview

Managing multiple servers manually is time-consuming and error-prone. This script automates the process by:

* Connecting to multiple servers via SSH
* Executing a command on each server
* Collecting the output
* Saving results in a structured report file

This type of automation is commonly used in **infrastructure monitoring, server auditing, and health checks**.

---

## ⚙️ Features

* Connects to **multiple servers automatically**
* Executes **remote commands using SSH**
* Handles **connection failures gracefully**
* Generates a **centralized report file**
* Uses **strict Bash error handling** for reliability

---

## 🛠 Technologies Used

* **Bash Scripting**
* **SSH (Secure Shell)**
* **Linux Command Line**

---

## 📂 Project Structure

```
multi-server-ssh-automation/
│
├── multi_server_ssh.sh
├── report
└── README.md
```

| File                  | Description                                     |
| --------------------- | ----------------------------------------------- |
| `multi_server_ssh.sh` | Main Bash automation script                     |
| `report`              | Output file containing results from all servers |
| `README.md`           | Project documentation                           |

---

## 📜 Script Explanation

The script performs the following steps:

1. Defines a list of servers.
2. Iterates through each server.
3. Connects to the server using SSH.
4. Executes the `uptime` command.
5. Stores the result in a report file.

### Script Code

```bash
#!/bin/bash

set -euo pipefail

servers=("server1" "server2" "server3" "server4" "server5")

for server in "${servers[@]}"
do
    echo "Connecting to $server"

    result=$(ssh user@"$server" "uptime" 2>/dev/null || echo "Connection Failed")

    echo "$server : $result" >> report
done

echo "Report saved in Report file"
```

---

## 🔍 Key Concepts Used

### 1️⃣ `set -euo pipefail`

This enables **strict error handling** in Bash:

* `-e` → Exit immediately if a command fails
* `-u` → Error on undefined variables
* `-o pipefail` → Detect errors in pipelines

This ensures the script behaves safely in production environments.

---

### 2️⃣ Bash Arrays

```
servers=("server1" "server2" "server3" "server4" "server5")
```

Stores multiple server names in a list.

---

### 3️⃣ Loop Through Servers

```
for server in "${servers[@]}"
```

Iterates over each server and performs the SSH command.

---

### 4️⃣ Remote Command Execution

```
ssh user@"$server" "uptime"
```

Executes the `uptime` command on the remote server.

Example output:

```
10:15:03 up 12 days,  2 users,  load average: 0.20, 0.18, 0.15
```

---

### 5️⃣ Error Handling for SSH

```
2>/dev/null || echo "Connection Failed"
```

* Suppresses SSH errors
* If connection fails, prints **Connection Failed** instead

---

### 6️⃣ Logging Results

```
echo "$server : $result" >> report
```

Appends results to the `report` file.

Example output:

```
server1 : 10:15:03 up 12 days, 2 users, load average: 0.20, 0.18, 0.15
server2 : Connection Failed
server3 : 11:22:44 up 3 days, 1 user, load average: 0.10, 0.05, 0.02
```

---

## ▶️ How to Run the Script

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/multi-server-ssh-automation.git
```

---

### 2️⃣ Navigate to the Project Directory

```bash
cd multi-server-ssh-automation
```

---

### 3️⃣ Make the Script Executable

```bash
chmod +x multi_server_ssh.sh
```

---

### 4️⃣ Run the Script

```bash
./multi_server_ssh.sh
```

---

## 📊 Example Output

After execution, a file named **report** will be generated:

```
server1 : 10:15:03 up 12 days, 2 users, load average: 0.20, 0.18, 0.15
server2 : Connection Failed
server3 : 11:22:44 up 3 days, 1 user, load average: 0.10, 0.05, 0.02
server4 : 09:11:02 up 7 days, 3 users, load average: 0.30, 0.25, 0.22
server5 : Connection Failed
```

---

## 🌍 Real World Use Cases

This automation pattern is widely used for:

* **Server health monitoring**
* **Infrastructure auditing**
* **DevOps automation**
* **Remote command execution across clusters**
* **Large scale server management**

Example commands that can be automated:

```
uptime
df -h
free -h
top
docker ps
systemctl status nginx
```

---

## 🔒 Best Practices

For production environments:

* Use **SSH key authentication** instead of passwords
* Maintain a **server inventory file**
* Implement **parallel execution** for faster results
* Add **timestamps in logs**

Example improvement:

```
echo "$(date) | $server : $result" >> report
```

---

---

## 👨‍💻 Author

**Usman Ghani**

DevOps & Cloud Engineering Learner focused on:

* Linux
* Bash Automation
* Networking
* Cloud Infrastructure
* DevOps Engineering

---

## ⭐ Contributing

Contributions, improvements, and suggestions are welcome.

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Submit a Pull Request

---

## 📄 License

This project is open-source and available under the **MIT License**.
