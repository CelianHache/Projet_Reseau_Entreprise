# Configuration des VM

## Spécifications système

Voici un tableau pour documenter les spécifications système des machines virtuelles (VM).

| **Nom de la VM** | **OS**          | **Version**   | **Processeurs (vCPU)** | **RAM (GB)** | **Disque principal (GB)** | **Réseau**           | **Adresse IP**      | **Commentaire**            |
|------------------|----------------|---------------|-------------------------|--------------|---------------------------|-----------------------------------|----------------------|---------------------|
| VM-SRV-ROUTER    | Ubuntu         | 24.04.01 (LTS)         | 2          | 2           | 30       | LAN Interne, DMZ, WAN   | 10.0.3.1, 10.0.2.1, 10.0.1.1      | Routeur, Firewall      |
| VM-SRV-WEB       | Ubuntu         | 24.04.01 (LTS)         | 2          | 2           | 30       | DMZ                     | 10.0.2.3                          | Apache2                |
| VM-SRV-NGINX     | Ubuntu         | 24.04.01 (LTS)         | 2          | 2           | 30       | DMZ                     | 10.0.2.4                          | Nginx                  |
| VM-SRV-DNS       | Ubuntu         | 24.04.01 (LTS)         | 2          | 2           | 30       | DMZ                     | 10.0.2.5                          | Apache2                |
| VM-PC-USER1      | Ubuntu         | 24.04.01 (LTS)         | 2          | 2           | 30       | LAN Interne             | 10.0.1.X                          | Poste de l'utilisateur |

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