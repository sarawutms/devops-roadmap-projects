# 🚀 Server Stats Monitoring Script

🔗 **Project URL:** [Server Performance Stats](https://roadmap.sh/projects/server-stats)

## 📌 Description

A lightweight Bash script to analyze basic server performance statistics on any Linux system.

## 📊 Features

* ✅ Uptime (human-readable)
* ✅ CPU Usage (percentage)
* ✅ Memory Usage (used / total + percentage)
* ✅ Disk Usage (root partition)
* ✅ Top 5 processes by CPU usage
* ✅ Top 5 processes by Memory usage

## 🖥️ Preview

```
============= SERVER STATS =============
Uptime: 2 hours, 15 minutes

CPU Usage: 23.5%
Memory Usage: 61.2% (3200MB / 8000MB)
Disk Usage: 45%

========================================
Top 5 CPU Processes:
...

========================================
Top 5 Memory Processes:
...
```

---

## ⚙️ Requirements

* Linux OS (Ubuntu, Debian, CentOS, etc.)
* Bash shell
* Common tools:

  * `top`
  * `free`
  * `df`
  * `ps`
  * `awk`
  * `sed`

> 💡 Most Linux systems already include these tools.

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/sarawutms/server-performance-stats.git
cd server-performance-stats
```

Make the script executable:

```bash
chmod +x server-stats.sh
```

## ▶️ Usage

Run the script:

```bash
./server-stats.sh
```

## 🧠 How It Works

The script collects system data using standard Linux commands:

* `uptime` → system uptime
* `top` → CPU usage
* `free` → memory stats
* `df` → disk usage
* `ps` → running processes

Data is processed using `awk` and `sed` for formatting.
