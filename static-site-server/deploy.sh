#!/bin/bash

# get deploy.conf
source deploy.conf

echo "🚚 Deploying files to $SERVER_IP..."
rsync -avz --exclude='.git' --exclude='deploy.sh' --exclude='deploy.conf' ./ $SERVER_USER@$SERVER_IP:$TARGET_DIR
echo "🚀 Done!"
