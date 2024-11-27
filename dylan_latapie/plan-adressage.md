### 1. **Segmentation réseau**
Le réseau est divisé en plusieurs segments :
- **Réseau privé** : Utilisé pour les machines internes à l’entreprise.
- **DMZ (Zone Démilitarisée)** : Accueille des services accessibles de l’extérieur (comme un serveur DNS ou un serveur web).
- **Routeur** : Assure l’interconnexion entre le réseau privé, la DMZ, et éventuellement l’accès à l’extérieur.

### 2. **Plages d'adresses**
On subdivise le réseau 10.0.0.0/8 en sous-réseaux adaptés pour chaque segment, en tenant compte des besoins en nombre d'adresses IP.

| **Segment**             | **Sous-réseau**    | **Masque**      | **Plage d'adresses**   | **Utilisation**                                           |
|-------------------------|--------------------|-----------------|------------------------|-----------------------------------------------------------|
| Réseau privé            | 10.0.1.0/24        | 255.255.255.0   | 10.0.1.1 - 10.0.1.254  | Machines internes de l'entreprise (clients, etc.).        |
| DMZ                     | 10.0.2.0/24        | 255.255.255.0   | 10.0.2.1 - 10.0.2.254  | Services publics (DNS, web, etc.).                        |
| Interconnexion routeur  | 10.0.3.0/30        | 255.255.255.252 | 10.0.3.1 - 10.0.3.2    | Lien point à point entre routeur interne et externe.      |

---

### 3. **Détails d’adressage**
#### Réseau privé (10.0.1.0/24)
- **Passerelle** : 10.0.1.1
- **Clients DHCP** : 10.0.1.10 - 10.0.1.210

#### DMZ (10.0.2.0/24)
- **Passerelle** : 10.0.2.1
- **Serveur DNS** : 10.0.2.10
- **Serveur Web** : 10.0.2.20

#### Interconnexion routeur (10.0.3.0/30)
- **Routeur interne** : 10.0.3.1
- **Routeur externe** : 10.0.3.2

---

### 4. **Plan de routage**
#### Routes des segments :
1. **Réseau privé** :
   - Destination : 10.0.2.0/24 → Passerelle 10.0.1.1 (via routeur interne)
2. **DMZ** :
   - Destination : 10.0.1.0/24 → Passerelle 10.0.2.1 (via routeur interne)
3. **Routeur** :
   - Destination : 0.0.0.0/0 (Internet) → Interface du routeur externe.

---

### 5. **Plan de NAT**
- **NAT interne (masquerading)** : Pour permettre aux clients du réseau privé d’accéder à Internet en utilisant l’adresse IP publique du routeur.
- **Port forwarding** : Pour rediriger les requêtes HTTP/HTTPS et DNS vers les serveurs correspondants dans la DMZ.