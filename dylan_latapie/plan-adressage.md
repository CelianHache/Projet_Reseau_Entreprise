# 1. **Segmentation réseau**
Le réseau est divisé en plusieurs segments :
- **Réseau privé** : Utilisé pour les machines internes à l’entreprise.
- **DMZ (Zone Démilitarisée)** : Accueille des services accessibles de l’extérieur (comme un serveur DNS ou un serveur web).
- **Routeur** : Assure l’interconnexion entre le réseau privé, la DMZ, et éventuellement l’accès à l’extérieur.

# 2. **Plages d'adresses**
On subdivise le réseau 10.0.0.0/8 en sous-réseaux adaptés pour chaque segment, en tenant compte des besoins en nombre d'adresses IP.

| **Segment**             | **Sous-réseau**    | **Masque**      | **Plage d'adresses**   | **Utilisation**                                           |
|-------------------------|--------------------|-----------------|------------------------|-----------------------------------------------------------|
| Réseau privé            | 10.1.1.0/24        | 255.255.255.0   | 10.0.1.1 - 10.0.1.254  | Machines internes de l'entreprise (clients, etc).         |
| DMZ                     | 10.1.2.0/24        | 255.255.255.0   | 10.0.2.1 - 10.0.2.254  | Services publics (DNS, WEB, NGINX etc).                   |
| Interconnexion routeur  | 10.0.0.0/24        | 255.255.255.0   | 10.0.0.1 - 10.0.0.254  |                                                           |

---

# 3. **Détails d’adressage**
## Réseau privé (10.1.1.0/24)
- **Passerelle** : 10.1.1.1
- **Clients DHCP** : 10.1.1.10 - 10.1.1.210
- **Serveur DHCP**: 10.1.1.1

## DMZ (10.1.2.0/24)
- **Passerelle** : 10.1.2.1
- **Serveur DNS** : 10.1.2.10
- **Serveur Web** : 10.1.2.11
- **Serveur NGINX** : 10.1.2.12

## Interconnexion routeur (10.0.0.0/24)
- **Routeur interne (Dylan)** : 10.0.0.4
- **Routeur externe 1 (Antoine)** : 10.0.0.2
- **Routeur externe 2 (Célian)** : 10.0.0.3
- **Routeur externe 3 (Julien)** : 10.0.0.5
