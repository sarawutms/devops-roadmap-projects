# Nginx Log Analyser

🔗 **Project URL:** [Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)	

## 📌 Description

A simple command-line tool written in Bash to analyze Nginx access logs. This project is a solution to the "Nginx Log Analyser" challenge from [roadmap.sh](https://roadmap.sh/projects/nginx-log-analyser).

## Features

This script reads a standard Nginx access log file and extracts the following statistics:
- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

## Prerequisites

- A Linux/Unix-like environment (Bash)
- Standard text processing tools: `awk`, `sort`, `uniq`, `head`

## How to Use

1. **Download the sample Nginx log file**:
   ```bash
   wget -O access.log [Here](https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log)
   ```
2. **Make the script executable**:
   ```bash
   chmod +x analyze_logs.sh
   ```
3. **Run the script by passing the log file as an argument**:
   ```bash
   ./analyze_logs.sh access.log
   ```
## Example Output

Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests

Top 5 most requested paths:
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests

Top 5 response status codes:
200 - 1000 requests
404 - 600 requests
500 - 50 requests

Top 5 user agents:
Mozilla/5.0 - 1000 requests
curl/7.68.0 - 600 requests
PostmanRuntime/7.28.0 - 50 requests
