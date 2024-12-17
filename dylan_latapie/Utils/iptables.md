# Delete all iptables
```bash
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
```

# NAT Rules (PREROUTING and POSTROUTING)
```bash
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 80 -j DNAT --to-destination 10.1.2.11
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 443 -j DNAT --to-destination 10.1.2.11
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 53 -j DNAT --to-destination 10.1.2.10
sudo iptables -t nat -A PREROUTING -i enp0s3 -p udp --dport 53 -j DNAT --to-destination 10.1.2.10
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
```

# Policy (Default DROP)
```bash
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
```

# Localhost Rules
```bash
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
```

# FORWARD Rules
# LAN ↔ EXT
```bash
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT
```

# DMZ ↔ EXT
```bash
sudo iptables -A FORWARD -i enp0s9 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s9 -j ACCEPT
```

# LAN ↔ DMZ
```bash
sudo iptables -A FORWARD -i enp0s8 -o enp0s9 -j ACCEPT
sudo iptables -A FORWARD -i enp0s9 -o enp0s8 -j ACCEPT
```

# ICMP Rules
```bash
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT
```
