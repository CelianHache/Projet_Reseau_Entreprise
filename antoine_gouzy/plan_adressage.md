## Plan d'adressage

| **Département/Usage**  | **Plage d'adresses IP**       | **Masque de sous-réseau** | **Passerelle (Gateway)** | **Remarques**                  |
|-------------------------|---------------------------|------------------------|--------------------------|--------------------------------|
| Réseau utilisateur (privé) | 10.5.1.0 - 10.5.1.254 | 255.255.255.0 (/24) | 10.5.1.10 |          |
| DMZ | 10.5.2.0 - 10.5.2.254 | 255.255.255.0 (/24) | 10.5.2.10 |  |


## Partie III
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j DNAT --to-destination 10.5.2.2:80

## Partie IV