# 在目标🎯服务器上，使用 【新方法】创建新的客户端文件
```bash
sudo ./install-openvpn.sh # 配置文件名字 [name⚠️]
cat /root/[name⚠️].ovpn
```

# 在新的服务器上安装openVPN
```bash
# 把复制的.ovpn文件粘贴到这里
sudo nano [name⚠️].ovpn

# ⚠️⛔️ 记得删掉 这一行
# block-outside-dns

# 最后面加上这个，这样这个IP就走openVPN 其他流量是正常走本地流量
route-nopull
route 93.184.216.34 255.255.255.255 vpn_gateway  # example.com 的 IP
route 198.51.100.1 255.255.255.255 vpn_gateway   # specific-site.com 的 IP
```

# 手动运行 OpenVPN 和 关闭
```bash
sudo openvpn --config /root/[name⚠️].ovpn --daemon
# 关闭
sudo killall openvpn
```

# 测试目标 IP（走 VPN）  
```bash
# 应经过 10.8.0.1（VPN 网关），最终到达深圳服务器的公网 IP（47.123.45.67）。
traceroute 12.23.34.45
```
# 持久化配置（可选）
```bash
sudo mv /root/[name⚠️].ovpn /etc/openvpn/client.conf
# 启用服务  
sudo systemctl enable openvpn@client.service
sudo systemctl start openvpn@client.service
# 检查状态
sudo systemctl status openvpn@client.service
# 停止服务（临时关闭）暂时停止 OpenVPN 客户端运行，但保留开机自启设置
sudo systemctl stop openvpn@client.service
# 禁用服务（取消开机自启）
sudo systemctl disable openvpn@client.service
# 检查进程：
ps aux | grep openvpn
```
