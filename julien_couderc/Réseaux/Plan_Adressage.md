# Plan d'adressage du réseau privé

## 1. Réseau privé
- **Plage d'adresses** : 192.168.1.0/24
- **Passerelle par défaut** : 192.168.1.1

| Nom de la Machine    | Adresse IP      | Masque de sous-réseau | Rôle                          |
|-----------------------|-----------------|------------------------|-------------------------------|
| Machine client 1      | 192.168.1.10   | 255.255.255.0          | Station de travail            |

## 2. DMZ (Zone démilitarisée)
- **Plage d'adresses** : 192.168.2.0/24
- **Passerelle par défaut** : 192.168.2.1

| Nom de la Machine    | Adresse IP      | Masque de sous-réseau | Rôle                          |
|-----------------------|-----------------|------------------------|-------------------------------|
| Serveur Web (DMZ)     | 192.168.2.2    | 255.255.255.0          | Services accessibles publiquement |
| Serveur DNS (DMZ)     | 192.168.2.3    | 255.255.255.0          | Résolution de noms externe   |
| Serveur NGINX (DMZ)     | 192.168.2.4    | 255.255.255.0          | Services accessibles publiquement |


## 3. Interface d'interconnexion
- **Plage d'adresses** : 192.168.3.0/30
- **Passerelle par défaut** : 10.0.0.5

| Nom de la Machine        | Adresse IP      | Masque de sous-réseau | Rôle               |
|---------------------------|-----------------|------------------------|--------------------|
| Routeur entreprise (WAN) | 10.0.0.5, 192.168.1.1, 192.168.2.1       | 255.255.255.252        | Routeur, firewall, DHCP |
