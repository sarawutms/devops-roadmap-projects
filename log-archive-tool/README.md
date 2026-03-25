# 🚀 Log Archive Tool

A simple CLI tool to archive system logs by compressing them into `.tar.gz` files with timestamps. This helps keep systems clean while preserving logs for future reference.

🔗 **Project URL:** [Log Archive Tool](https://roadmap.sh/projects/log-archive-tool)

## 📌 Features

* Archive logs from any directory (e.g. `/var/log`)
* Compress logs into `.tar.gz`
* Timestamped filenames
* Logging system for tracking archive history
* Handles permission issues gracefully
* Avoids "file changed during read" errors
* Ready for automation with cron

## 🛠️ Usage

```bash
./log-archive.sh <log-directory>
```

### Example

```bash
sudo ./log-archive.sh /var/log
```

## 📂 Output Structure

```
archives/
 └── logs_archive_YYYYMMDD_HHMMSS.tar.gz

archive.log
```

## ⚙️ How It Works

1. Validate input directory
2. Warn if not running as root
3. Create archive directory
4. Generate timestamp
5. Copy logs to `/tmp`
6. Compress into `.tar.gz`
7. Remove temporary files
8. Log the operation


## 🔄 Flow Diagram

```
[Start]
   ↓
[Receive Argument]
   ↓
[Validate Directory]
   ↓
[Check Permissions]
   ↓
[Create Archive Folder]
   ↓
[Generate Timestamp]
   ↓
[Copy Logs to /tmp]
   ↓
[Compress to tar.gz]
   ↓
[Delete Temp Files]
   ↓
[Write Log]
   ↓
[Done]
```

## ⏰ Automation with Cron

Edit crontab:

```bash
crontab -e
```

Run every day at 1 AM:

```bash
0 1 * * * /path/to/log-archive.sh /var/log
```

## ⚠️ Notes

* Some system logs require root privileges
* Use `sudo` for full access
* Without root, some files may be skipped

## 💡 Future Improvements

* Upload archives to cloud (AWS S3, GCP, etc.)
* Email notifications after archive
* Auto-delete old archives
* Convert to installable CLI tool
