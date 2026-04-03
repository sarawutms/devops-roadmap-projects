#!/bin/bash

# Your Server
USER="ubuntu"
IP="YOUR_SERVER_IP"
TARGET_DIR="/var/www/html"

echo "🚚 Deploying files to server..."
rsync -avz --exclude='.git' --exclude='deploy.sh' ./ $USER@$IP:$TARGET_DIR
echo "🚀 Done!"
