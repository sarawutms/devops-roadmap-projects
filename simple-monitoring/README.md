# Simple Monitoring Setup with Netdata 📊

[![Netdata](https://img.shields.io/badge/Netdata-Monitoring-00ab44?style=flat-square&logo=netdata)](https://www.netdata.cloud/)
[![Shell Script](https://img.shields.io/badge/Shell-Script-4EAA25?style=flat-square&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-Environment-E95420?style=flat-square&logo=ubuntu)](https://ubuntu.com/)

A foundational DevOps project aimed at automating the setup, testing, and teardown of a real-time system monitoring dashboard using **Netdata**. 

This project demonstrates the core principles of **Infrastructure as Code (IaC)** and **System Observability** by replacing manual installation processes with executable, repeatable shell scripts.

---

## 📂 Project Structure

The repository consists of three main automation scripts:

- `setup.sh`: Automates the installation of Netdata via the official kickstart script. It handles dependencies, bypasses interactive prompts, and ensures the Netdata service is enabled and actively running via `systemd`.
- `test_dashboard.sh`: A load-testing script designed to generate artificial system stress (CPU/Memory spikes). This allows for the real-time observation of metric changes on the Netdata web dashboard.
- `cleanup.sh`: A teardown script that safely uninstalls the Netdata agent, stops running services, and purges associated configuration files and logs, restoring the environment to its initial state.

---

## 🚀 Getting Started

### Prerequisites
Before running these scripts, ensure your environment meets the following requirements:
- A Linux-based operating system (Tested successfully on **Ubuntu**)
- `curl` installed (`sudo apt install curl`)
- `sudo` privileges for service management and package installation

### Installation & Usage

**1. Clone the repository**
```bash
git clone [https://github.com/](https://github.com/)<YOUR-USERNAME>/netdata-monitoring-scripts.git
cd simple-monitoring
