# 💼 Static Site Server - Deployment Automation

This project is part of the [roadmap.sh DevOps Projects](https://roadmap.sh/projects/static-site-server). It demonstrates how to set up a basic Linux web server using Nginx and automate the deployment of a static website using `rsync` and a Bash script.

## 📂 Project Structure
```text
.
├── index.html       # The main static HTML webpage
├── deploy.sh        # Deployment bash script using rsync
├── deploy.conf      # (User-created) Local config file for server credentials
├── .gitignore       # Prevents sensitive files (like deploy.conf) from being pushed to GitHub
└── README.md        # Project documentation and summary
```
## 🛠️  Prerequisites
* **A remote or local Linux Server (Ubuntu/Debian recommended).
* **Nginx installed and running on the target server.
* **SSH access to the server.
* **rsync installed on both the local machine and the server.  

## 🚀 Setup & Deployment Guide
1. Server Preparation (One-time setup)
On your Linux server, install Nginx and grant your user permission to the web directory:

```bash
sudo apt update
sudo apt install nginx -y
sudo chown -R $USER:$USER /var/www/html
```

2. Configure Local Deployment
For security reasons, do not hardcode your IP or username in the deployment script. Create a file named deploy.conf in the root of your local project:

```bash
# deploy.conf
SERVER_USER="your_ssh_username"
SERVER_IP="your_server_ip_address"
TARGET_DIR="/var/www/html"
```
(Ensure deploy.conf is added to your .gitignore file so it is not pushed to GitHub)

3. Deploy to Server
Make the script executable (first time only) and run the deployment:
```bash
chmod +x deploy.sh
./deploy.sh
```
The script will securely synchronize your local files to the Nginx server. Open your server's IP address in a web browser to see the live site.
