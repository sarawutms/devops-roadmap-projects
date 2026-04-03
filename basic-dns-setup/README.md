# Basic DNS Setup

This project is part of the [roadmap.sh DevOps Projects](https://roadmap.sh/projects/basic-dns-setup). The goal is to learn and practice the basics of DNS by setting up custom domains for a static site hosted on GitHub Pages and a web server hosted on a remote Linux server (Droplet).

## 🎯 Objectives
- Understand how DNS resolution works.
- Learn the difference between `A` records and `CNAME` records.
- Configure a custom domain for GitHub Pages.
- Configure a custom domain for a Linux Web Server (e.g., DigitalOcean Droplet).
- **Bonus:** Learn how to simulate DNS resolution locally using the OS `hosts` file.

---

## 🛠️ Task #1: Custom Domain for GitHub Pages

GitHub Pages does not provide a static IP address; instead, it provides a subdomain (e.g., `username.github.io`). Therefore, we use a **CNAME Record** to map our custom domain to the GitHub Pages URL.

### Steps:
1. **Purchase a Domain:** Register a domain (e.g., `arm-devops.com`) from a provider like Cloudflare, Namecheap, or GoDaddy.
2. **DNS Configuration (Domain Provider):**
   - Go to your domain provider's DNS Management dashboard.
   - Create a new record with the following details:
     - **Type:** `CNAME`
     - **Name:** `www` (or your desired subdomain)
     - **Target/Value:** `sarawutms.github.io` (Your GitHub Pages default URL)
3. **GitHub Configuration:**
   - Go to your GitHub repository > **Settings** > **Pages**.
   - Under **Custom domain**, type your new domain (e.g., `www.arm-devops.com`) and click **Save**.
   - Wait for the DNS to propagate (can take a few minutes to hours).
   - *Optional:* Check the "Enforce HTTPS" box to secure your site automatically.

---

## 🖥️ Task #2: Custom Domain for DigitalOcean Droplet (or Linux Server)

For a traditional web server setup (like the Nginx server in the previous project), the server is assigned a specific **Public IP Address**. We use an **A Record** to point our domain directly to this IP.

### Steps:
1. **Get the Server IP:** Identify the public IP of your Droplet/Server (e.g., `203.0.113.50`).
2. **DNS Configuration (Domain Provider):**
   - Go to the DNS Management dashboard.
   - Create a new record with the following details:
     - **Type:** `A`
     - **Name:** `@` (This represents the root domain, e.g., `arm-devops.com`)
     - **Target/Value:** `203.0.113.50` (Your server's Public IP)
3. **Nginx Configuration (Server-side):**
   - SSH into your server.
   - Edit your Nginx configuration file (usually in `/etc/nginx/sites-available/`).
   - Update the `server_name` directive to match your domain:
     ```nginx
     server {
         listen 80;
         server_name arm-devops.com [www.arm-devops.com](https://www.arm-devops.com);
         root /var/www/html;
         index index.html;
     }
     ```
   - Restart Nginx: `sudo systemctl restart nginx`

---

## 💡 Bonus Lab: Local DNS Simulation (SysAdmin Approach)

In a local lab environment where the server uses a **Private IP** (e.g., `192.168.13.113`), public DNS cannot be used. To test domain mapping without buying a domain, you can override the local DNS resolution using the `hosts` file.

### How to map a domain locally (Windows):
1. Open **Notepad** as Administrator.
2. Navigate to `C:\Windows\System32\drivers\etc` and open the `hosts` file.
3. Add the target IP and the desired dummy domain at the bottom:
   ```text
   192.168.13.113    arm-devops-lab.com
   ```
4. Save the file.
5. Open a web browser and navigate to http://arm-devops-lab.com. The operating system will bypass public DNS lookups and route traffic directly to the local Nginx server.
