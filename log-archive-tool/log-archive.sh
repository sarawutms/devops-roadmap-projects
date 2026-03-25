#!/bin/bash

# ==============================
# Log Archive Tool
# ==============================

set -e

# -------- CONFIG --------
ARCHIVE_BASE_DIR="./archives"
LOG_FILE="./archive.log"

# -------- FUNCTIONS --------
log_message() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" >> "$LOG_FILE"
}

error_exit() {
    echo "Error: $1"
    log_message "ERROR: $1"
    exit 1
}

# -------- CHECK ARGUMENT --------
if [ $# -lt 1 ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# -------- VALIDATE DIRECTORY --------
if [ ! -d "$LOG_DIR" ]; then
    error_exit "Directory does not exist: $LOG_DIR"
fi

# -------- CHECK PERMISSION --------
if [ "$EUID" -ne 0 ]; then
    echo "⚠️  Warning: Not running as root. Some files may be skipped."
    log_message "WARNING: Script not run as root"
fi

# -------- CREATE ARCHIVE DIRECTORY --------
mkdir -p "$ARCHIVE_BASE_DIR" || error_exit "Failed to create archive directory"

# -------- TIMESTAMP --------
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="$ARCHIVE_BASE_DIR/logs_archive_$TIMESTAMP.tar.gz"

# -------- TEMP COPY (avoid file changing issue) --------
TMP_DIR="/tmp/log_archive_$TIMESTAMP"

echo "📦 Copying logs to temp directory..."
cp -r "$LOG_DIR" "$TMP_DIR" 2>/dev/null || true

# -------- CREATE ARCHIVE --------
echo "🗜️  Compressing logs..."
tar --ignore-failed-read -czf "$ARCHIVE_FILE" -C /tmp "$(basename $TMP_DIR)" \
    || error_exit "Failed to create archive"

# -------- CLEANUP --------
rm -rf "$TMP_DIR"

# -------- SUCCESS --------
echo "✅ Archive created: $ARCHIVE_FILE"
log_message "SUCCESS: Archived $LOG_DIR -> $ARCHIVE_FILE"

exit 0
