#!/bin/bash

# Check if the user provided a log file argument
if [ -z "$1" ]; then
    echo "Usage: ./analyze_logs.sh <path_to_log_file>"
    exit 1
fi

LOG_FILE=$1

# Verify the file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | while read count ip; do
    echo "$ip - $count requests"
done
echo ""

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | while read count path; do
    echo "$path - $count requests"
done
echo ""

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | while read count status; do
    echo "$status - $count requests"
done
echo ""

echo "Top 5 user agents:"
# We use -F\" to change the delimiter to double quotes, making it easy to grab the user agent.
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | while read count ua; do
    echo "$ua - $count requests"
done
echo ""
