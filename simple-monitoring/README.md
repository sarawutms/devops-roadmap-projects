# Simple Monitoring Setup with Netdata 📊

🔗 **Project URL:** [Simple Monitoring](https://roadmap.sh/projects/simple-monitoring-dashboard)  
 
This project provides a set of Bash scripts to automate a monitoring setup using **Netdata**. It serves as an introduction to basic DevOps practices like Infrastructure as Code (IaC).

## 📂 Project Files
* `setup.sh` - Installs and automatically starts the Netdata service.
* `test_dashboard.sh` - Generates CPU load to test the real-time metrics on the dashboard.
* `cleanup.sh` - Uninstalls Netdata and removes all associated files to clean up the server.

## 🚀 How to Use

1. **Make the scripts executable:**
   ```bash
   chmod +x *.sh
   ```
2. **Run the installation:**
   ```bash
   ./setup.sh
   ```
(After installation, view your dashboard at http://<your-server-ip>:19999)

3. **Run the test (Keep the dashboard open while running):**
  ```bash
  ./test_dashboard.sh
  ```
4. **Run the cleanup (To completely uninstall):**
  ```bash
  ./cleanup.sh
  ```
