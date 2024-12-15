# Delete all iptables
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

# NAT Rules (PREROUTING and POSTROUTING)
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 80 -j DNAT --to-destination 10.1.2.11
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 443 -j DNAT --to-destination 10.1.2.11
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 53 -j DNAT --to-destination 10.1.2.10
sudo iptables -t nat -A PREROUTING -i enp0s3 -p udp --dport 53 -j DNAT --to-destination 10.1.2.10
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

# Policy (Default DROP)
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# Localhost Rules
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# FORWARD Rules
# LAN ↔ EXT
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT

# DMZ ↔ EXT
sudo iptables -A FORWARD -i enp0s9 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s9 -j ACCEPT

# LAN ↔ DMZ
sudo iptables -A FORWARD -i enp0s8 -o enp0s9 -j ACCEPT
sudo iptables -A FORWARD -i enp0s9 -o enp0s8 -j ACCEPT

# ICMP Rules
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT
