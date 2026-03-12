# Deployment Automation Script

## Overview

This project provides a **Bash-based deployment automation script** that simulates a **real-world DevOps deployment workflow**.

In many production environments, deploying an application involves multiple steps such as:

* Pulling the latest code from a repository
* Restarting the application service
* Verifying the application is running correctly
* Rolling back the deployment if something fails

This script automates those tasks and demonstrates **practical DevOps troubleshooting and deployment validation** using standard Linux tools.

The objective of this project is to simulate a **production-safe deployment process** where the system verifies the deployment and automatically performs a **rollback if the application fails to start properly**.

---

# Problem Scenario

During deployment of a web application, several things can go wrong:

* New code may contain errors
* The service may fail to restart
* The application may not listen on the expected port
* The deployment may break the running system

In a production environment, such failures must be **detected quickly and resolved automatically**.

Your job as a **DevOps Engineer** is to implement a deployment process that:

1. Deploys the latest code
2. Restarts the application service
3. Verifies the application is running
4. Rolls back to the previous version if deployment fails

This script simulates that entire workflow.

---

# Features

The script performs the following tasks automatically:

* Pulls the latest code from a Git repository
* Restarts the specified service
* Checks if the service is listening on the expected port
* Automatically performs a rollback if deployment fails

---

# Deployment Workflow

The deployment process follows this sequence:

Start Deployment

User provides application path

Navigate to application directory

Pull latest code from repository

Restart the application service

Verify the service port is listening

If port is active → Deployment successful

If port is not active → Rollback to previous version

Restart service again after rollback

End process

---

# Script Breakdown

## 1. Application Path Input

The script first asks the user to enter the **path to the application directory**.

Example

```
Enter the path of your app:
```

The script then moves to that directory.

If the path is invalid, the script exits to prevent deployment errors.

Command used

```
cd "$path"
```

---

# 2. Pull Latest Code

The script retrieves the **latest version of the code** from the Git repository.

Command used

```
git pull origin master
```

If the pull operation fails, the script informs the user to resolve Git issues.

Example output

```
Pulling the latest code
Unable to pull the code Solve the git errors
```

---

# 3. Service Restart

After updating the code, the script asks the user to provide the **service name**.

Example

```
Enter the Service:
```

The service is then restarted using systemd.

Command used

```
systemctl restart service_name
```

This step ensures the application reloads the new code.

---

# 4. Port Verification

Once the service is restarted, the script verifies whether the application is **listening on the expected port**.

The user provides the port number.

Example

```
Enter the Port Number:
```

The script checks the listening port using:

```
ss -tulnp4
```

If the port is active, the deployment is considered successful.

Example output

```
Deployment Success
```

---

# 5. Automatic Rollback

If the application **fails to listen on the expected port**, the deployment is considered unsuccessful.

The script automatically performs a rollback to the previous version of the code.

Rollback command

```
git reset --hard HEAD~1
```

This command restores the previous commit.

After rollback, the service is restarted again to bring the application back to a working state.

Example output

```
Deployment Fails Roll Back
```

---

# Technologies Used

This project demonstrates the use of common DevOps tools and Linux utilities.

* Bash scripting
* Git version control
* Linux systemd services
* Linux networking tools

Key commands used in the script

```
git pull
git reset
systemctl restart
ss
grep
cd
```

---

# Requirements

To run this script successfully, the following components must be installed on the server:

* Linux system (Ubuntu / Debian recommended)
* Git installed
* systemd-based service management
* Network utility `ss` available
* Sudo privileges for restarting services

---

# How to Use

Clone the repository

```
git clone https://github.com/yourusername/deployment-script.git
```

Move into the project directory

```
cd deployment-script
```

Make the script executable

```
chmod +x deploy.sh
```

Run the deployment script

```
./deploy.sh
```

Follow the prompts and provide:

* Application directory path
* Service name
* Application port

---

# Example Deployment

Example user input

```
Enter the path of your app: /var/www/myapp
Enter the Service: nginx
Enter the Port Number: 80
```

Example successful output

```
Pulling the latest code
Restarting the Service
Deployment Success
```

Example failed deployment

```
Pulling the latest code
Restarting the Service
Deployment Fails Roll Back
```

---

# Real World Use Case

This script reflects a simplified version of what happens in **production deployment pipelines**.

In real DevOps environments, similar logic is used in:

* CI/CD pipelines
* Blue-green deployments
* Canary deployments
* Automated rollback systems

Tools like Jenkins, GitHub Actions, GitLab CI, and Kubernetes implement similar safety mechanisms.

---

# Learning Outcomes

By studying and using this project, you will learn:

* How deployment automation works
* How to validate application health after deployment
* How to implement rollback strategies
* How DevOps engineers handle production deployment failures
* Practical usage of Bash scripting in real infrastructure scenarios

---


# Author

Usman Ghani

DevOps Enthusiast
Linux | Bash | Networking | Automation

---

# License

This project is open source and available under the MIT License.
