#!/bin/bash
# setup.sh - Install Netdata automatically

echo "🚀 Starting Netdata Installation..."

# ใช้ curl -sL (s = silent ซ่อน progress, L = location ตามลิงก์ redirect)
# และใช้ URL ปัจจุบันของ Netdata
curl -sL https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh

# รันสคริปต์การติดตั้งแบบไม่ต้องรอการยืนยัน
sh /tmp/netdata-kickstart.sh --non-interactive

# Enable and start the service
sudo systemctl enable netdata
sudo systemctl start netdata

echo "✅ Netdata installed and running on port 19999"
