## Plan d'adressage

| **Département/Usage**  | **Plage d'adresses IP**       | **Masque de sous-réseau** | **Passerelle (Gateway)** | **Remarques**                  |
|-------------------------|---------------------------|------------------------|--------------------------|--------------------------------|
| Réseau utilisateur (privé) | 10.5.1.0 - 10.5.1.254 | 255.255.255.0 (/24) | 10.5.1.10 |          |
| DMZ | 10.5.2.0 - 10.5.2.254 | 255.255.255.0 (/24) | 10.5.2.10 |  |

ip link add link eth0