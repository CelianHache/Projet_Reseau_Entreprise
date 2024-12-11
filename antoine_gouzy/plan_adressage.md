## Plan d'adressage

| **Département/Usage**  | **Plage d'adresses IP**       | **Masque de sous-réseau** | **Passerelle (Gateway)** | **Remarques**                  |
|-------------------------|---------------------------|------------------------|--------------------------|--------------------------------|
| Réseau utilisateur (privé) | 10.5.1.0 - 10.5.1.254 | 255.255.255.0 (/24) | 10.5.1.10 |          |
| DMZ | 10.5.2.0 - 10.5.2.254 | 255.255.255.0 (/24) | 10.5.2.10 |  |


## Partie III
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j DNAT --to-destination 10.5.2.2:80

## Partie IV
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -p tcp --dport 443 -j ACCEPT  #Https
iptables -A INPUT -p tcp --dport 80 -j ACCEPT   #Http
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   #SSH
iptables -A INPUT -p udp --dport 53 -j ACCEPT   #DNS UDP
iptables -A INPUT -p tcp --dport 53 -j ACCEPT   #DNS TCP
iptables -A INPUT -i lo -j ACCEPT               #localhost
iptables -A INPUT -p icmp -j ACCEPT             #icmp

iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT   # dmz -> public
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT   # public -> dmz

iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT   # private -> public
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT   # public -> private

iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT   # dmz -> private
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT   # private -> dmz