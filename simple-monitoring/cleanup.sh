#!/bin/bash
# cleanup.sh - Completely remove Netdata

echo "🧹 Cleaning up Netdata..."

# Stop the service
sudo systemctl stop netdata

# Use the official uninstaller if available, otherwise manual purge
if [ -f /usr/libexec/netdata/netdata-uninstaller.sh ]; then
    sudo /usr/libexec/netdata/netdata-uninstaller.sh --yes --force
else
    sudo apt-get purge -y netdata
    sudo rm -rf /etc/netdata /var/lib/netdata /var/log/netdata
fi

echo "✨ System cleaned."
