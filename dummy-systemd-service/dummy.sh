#!/bin/bash
# dummy.sh - A script that simulates a long-running background process.

# หา Path ปัจจุบันของไฟล์สคริปต์นี้
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
LOG_FILE="$SCRIPT_DIR/dummy-service.log"

while true; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Dummy service is running..." >> "$LOG_FILE"
    sleep 10
done
