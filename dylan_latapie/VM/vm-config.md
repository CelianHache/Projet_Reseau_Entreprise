# Configuration des VM

## Spécifications système

Voici un tableau pour documenter les spécifications système des machines virtuelles (VM).

| **Nom de la VM** | **OS**         | **Version**    | **Processeurs (vCPU)** | **RAM (GB)** | **Disque dur (GB)** | **Réseau**             | **Adresse IP**               | **Commentaire**           |
|------------------|----------------|----------------|------------------------|--------------|---------------------|------------------------|------------------------------|---------------------------|
| VM-SRV-ROUTER    | Ubuntu Server  | 24.04.01 (LTS) | 2                      | 2            | 30                  | LAN Interne, DMZ, WAN  | 10.0.0.4, 10.1.2.1, 10.1.1.1 | Routeur, Firewall, DHCP   |
| VM-SRV-DNS       | Ubuntu Server  | 24.04.01 (LTS) | 2                      | 2            | 30                  | DMZ                    | 10.1.2.10                    | Bind9                     |
| VM-SRV-WEB       | Ubuntu Server  | 24.04.01 (LTS) | 2                      | 2            | 30                  | DMZ                    | 10.1.2.11                    | Apache2                   |
| VM-SRV-NGINX     | Ubuntu Server  | 24.04.01 (LTS) | 2                      | 2            | 30                  | DMZ                    | 10.1.2.12                    | Nginx                     |
| VM-PC-USER1      | Ubuntu Desktop | 24.04.01 (LTS) | 2                      | 2            | 30                  | LAN Interne            | 10.1.1.X                     | Poste de l'utilisateur    |

### **Description des colonnes :**
- **Nom de la VM** : Identifiant unique ou nom de la machine.
- **OS** : Système d’exploitation installé sur la VM.
- **Version** : Version précise du système d’exploitation.
- **Processeurs (vCPU)** : Nombre de processeurs virtuels attribués.
- **RAM (GB)** : Quantité de mémoire vive allouée à la VM.
- **Disque principal (GB)** : Taille du disque système principal.
- **Réseau** : Configuration réseau ou VLAN où se trouve la VM.
- **Adresse IP** : Adresse IP fixe ou dynamique de la VM.
- **Commentaire** : Informations supplémentaires ou rôle de la VM.

## Configuration des VM après clonnage
Changer le hostname de la VM :
```
sudo hostnamectl set-hostname <newhostname>
```

Configurer les interfaces réseau de la VM :
```
sudo nano /etc/netplan/<fichier_conf>.yaml
```
```
sudo netplan apply
```

## Configuration Ubuntu (VM GENERIC)
### Informations VM
- **Nom de la machine** : `vm-srv`
- **Mot de passe root** : `password`
- **Serveur SSH** : `actif`

### **Utilisateur par défaut** 
#### **VM Serveur**
- **Nom d'utilisateur** : `dylanlatapie`  
- **Mot de passe** : `password`
#### **VM PC**
- **Nom d'utilisateur** : `dylanlatapie`  
- **Mot de passe** : `password1!`
