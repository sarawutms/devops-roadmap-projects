# SSH Remote Server Setup Project

## Objective
Setup a remote Linux server (Ubuntu) and configure it to allow secure SSH connections using multiple SSH key pairs. This project also includes configuring the local SSH client and implementing brute-force protection.

## 1. Server Provisioning
* **Cloud Provider:** DigitalOcean (or your chosen provider)
* **Operating System:** Ubuntu 24.04 LTS
* **Server IP Address:** YOUR_SERVER_IP
* **Username:** YOUR_USERNAME (e.g., root or ubuntu)

## 2. Generating SSH Key Pairs
To meet the requirements, two distinct ED25519 SSH key pairs were generated on the local machine. The private keys remain secured locally and will not be shared.

```bash
# Generate Key Pair 1
ssh-keygen -t ed25519 -C "project_key_1" -f ~/.ssh/id_ed25519_key1

# Generate Key Pair 2
ssh-keygen -t ed25519 -C "project_key_2" -f ~/.ssh/id_ed25519_key2
```

## 3. Adding Public Keys to the Server
The public keys (.pub files) were copied to the remote server to authenticate the connections.

1. Displayed the public keys locally:
```bash
cat ~/.ssh/id_ed25519_key1.pub
cat ~/.ssh/id_ed25519_key2.pub
```
2. Appended both keys to the server's ~/.ssh/authorized_keys file using the server console:
```bash
mkdir -p ~/.ssh
echo "<PASTE_PUBLIC_KEY_1_HERE>" >> ~/.ssh/authorized_keys
echo "<PASTE_PUBLIC_KEY_2_HERE>" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

## 4. Connecting with Specific SSH Keys
Successfully tested the connection to the remote server using both keys by explicitly stating the path to the private key with the -i flag:

```bash
# Connecting with Key 1
ssh -i ~/.ssh/id_ed25519_key1 YOUR_USERNAME@YOUR_SERVER_IP

# Connecting with Key 2
ssh -i ~/.ssh/id_ed25519_key2 YOUR_USERNAME@YOUR_SERVER_IP
```

## 5. Configuring ~/.ssh/config
To simplify the connection process, the local SSH configuration file (~/.ssh/config) was updated to create custom aliases for both keys.

**Contents added to ~/.ssh/config:**
```text
Host server-key1
    HostName YOUR_SERVER_IP
    User YOUR_USERNAME
    IdentityFile ~/.ssh/id_ed25519_key1

Host server-key2
    HostName YOUR_SERVER_IP
    User YOUR_USERNAME
    IdentityFile ~/.ssh/id_ed25519_key2
```

**Testing the alias connections:**
```bash
ssh server-key1
ssh server-key2
```

## 6. Stretch Goal: fail2ban Installation
To protect the server from brute-force login attempts, fail2ban was installed and configured.

```bash
# Update packages and install fail2ban
sudo apt update
sudo apt install fail2ban -y

# Create a local copy of the configuration to prevent overwrite on updates
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Enable and start the service
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Verify that the SSH jail is active and monitoring
sudo fail2ban-client status sshd
```
