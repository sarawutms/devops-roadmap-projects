# Basic DNS Setup

A quick lab project to practice setting up DNS records. The goal here is simple: link a custom domain to a GitHub Pages site and a self-hosted Nginx Linux server. 

🔗 **Project URL:** [Basic DNS Setup](https://roadmap.sh/projects/basic-dns-setup)

## 🎯 What I learned
- How DNS resolution actually works.
- When to use an `A` record (pointing to an IP) vs a `CNAME` record (pointing to another name).
- How to "hack" the local DNS using the Windows `hosts` file for testing without buying a real domain.

---

## 🛠️ Task 1: Custom Domain for GitHub Pages

GitHub Pages doesn't give you a static IP. Instead, it gives you a subdomain (like `sarawutms.github.io`). Because of this, we need to use a **CNAME Record**.

**How I would set it up (using a hypothetical domain `www.arm-devops.com`):**
1. **DNS Provider:** Go to my domain provider's dashboard (e.g., Cloudflare) and add a `CNAME` record. Set the name to `www` and the target to `sarawutms.github.io`.
2. **GitHub Settings:** In the repository settings under **Pages**, add the custom domain (`www.arm-devops.com`) and save. 

---

## 🖥️ Task 2: Custom Domain for a Linux Server (Nginx)

Unlike GitHub Pages, a traditional web server (like my local Nginx setup) has a specific **IP Address**. For this, we use an **A Record**.

**How I would set it up for a public server:**
1. **DNS Provider:** Add an `A` record. Set the name to `@` (root domain) and point the target to the server's Public IP.
2. **Server Config:** SSH into the Linux server, open the Nginx config file (`/etc/nginx/sites-available/default`), and update the `server_name` to match the domain.
3. Restart Nginx to apply changes: `sudo systemctl restart nginx`

---

## 💡 Bonus: Local DNS Trick (SysAdmin Style)

Since my current lab server uses a **Private IP** (`192.168.13.113`), I can't use public DNS. To test things out without buying a real domain, I simulated it locally using the Windows `hosts` file with a custom local domain: `arm-devops-lab.com`.

**The process:**
1. Opened **Notepad** as Administrator.
2. Opened the file at `C:\Windows\System32\drivers\etc\hosts`.
3. Added my Nginx server's IP and my dummy domain at the bottom:
   ```text
   192.168.13.113    arm-devops-lab.com
   ```
4. Saved it. Now, typing http://arm-devops-lab.com in my browser bypasses the public internet and routes directly to my local Nginx server!  

## 📸 Proof of Concept
Here is the result of testing the local DNS resolution. The browser successfully resolves arm-devops-lab.com and serves my static site from the Nginx server:  

![Local DNS Test showing Nginx Site](arm-devops-lab.jpg)
