#!/bin/bash

echo "============= SERVER STATS ============="
echo -e "\e[36mUptime:\e[0m $(uptime -p | sed 's/up //')"

# ---------------- CPU ----------------
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", 100 - $8}')
echo -e "\e[32mCPU Usage:\e[0m ${cpu}%"

# ---------------- MEMORY ----------------
mem=$(free -m | awk 'NR==2 {printf "%.1f", $3/$2 * 100}')
echo -e "\e[34mMemory Usage:\e[0m ${mem}%"

# ---------------- DISK ----------------
disk=$(df -h / | awk 'NR==2 {print $5}')
echo -e "\e[33mDisk Usage:\e[0m ${disk}"
echo "========================================"

# ---------------- TOP CPU ----------------
echo -e "\e[31mTop 5 CPU Processes:\e[0m"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
echo "========================================"

# ---------------- TOP MEMORY ----------------
echo -e "\e[31mTop 5 Memory Processes:\e[0m"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6
echo ""
