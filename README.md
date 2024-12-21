# Install OpenVPN on Aliyun Server 🚀

## Project Overview 📖

This project provides a complete solution for installing and configuring OpenVPN on Alibaba Cloud (Aliyun) servers. Due to the unique network environment in mainland China, we've adopted a step-by-step installation approach to ensure a smooth setup process.

### Why This Project? 🤔

- 🌍 Access Chinese websites from abroad
- 🔒 Solves EasyRSA download issues in mainland China
- 📝 Provides comprehensive installation and configuration guide
- 👥 Supports multi-client configuration
- ☁️ Optimized for Aliyun server environment

## Prerequisites ✅

- 🖥️ One server outside mainland China (for downloading EasyRSA)
- 🖥️ One Aliyun server (for OpenVPN installation)
- 🔑 Root access privileges
- 💻 Basic Linux command line knowledge

## Installation Steps 🛠️

### 1. Download EasyRSA 📥

On your server outside mainland China, execute:
```bash
sudo nano download_easy_rsa.sh # Edit script
chmod +x download_easy_rsa.sh # Grant execution permission
./download_easy_rsa.sh # Run script
```

### 2. Transfer Files 📤
```bash
scp EasyRSA-3.2.1.tgz user@serverA_IP:~/
```

### 3. Configure EasyRSA 🔧
Login to Server A and execute:
```bash
# Create EasyRSA directory
sudo mkdir -p /etc/openvpn/server/easy-rsa/

# Extract EasyRSA package
sudo tar xzvf ~/EasyRSA-3.2.1.tgz -C /etc/openvpn/server/easy-rsa/ --strip-components 1

# Set permissions
sudo chown -R root:root /etc/openvpn/server/easy-rsa/
```

### 4. Install OpenVPN 🔨
```bash
sudo nano install-openvpn.sh # Edit script
chmod +x install-openvpn.sh # Grant execution permission
./install-openvpn.sh # Run script
```

### 5. Download Client Configuration 📱
```bash
scp root@<server_IP>:/root/client.ovpn ~/Downloads/
```

### 6. Required Aliyun Ports 🔓

Inbound:
- 🔵 UDP port 1194
- 🔵 ICMP protocol
- 🔵 Port 80
- 🔵 Port 443
- 🔵 Port 22

Outbound:
- 🔵 All ports