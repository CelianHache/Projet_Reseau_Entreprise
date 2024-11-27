# Plan d'Adressage IP

## 1. Informations Générales
- **Plage IP privée utilisée** : 172.16.0.0/12
- **Masque de sous-réseau** : /24 (255.255.255.0)
- **Capacité par sous-réseau** : 254 hôtes utilisables
- **Réserves** :
  - Adresse `.1` pour la passerelle par défaut
  - Adresse `.254` pour des équipements spéciaux ou de supervision

---

## 2. Adressage par Service / Département

| **Service**           | **Sous-réseau**     | **Plage IP**             | **Remarques**                          |
|------------------------|---------------------|--------------------------|----------------------------------------|
| Serveur privé          | 172.16.1.0/24      | 172.16.1.1 - 172.16.1.254 | Réservé aux postes administratifs      |
| DMZ                    | 172.16.2.0/24      | 172.16.2.1 - 172.16.2.254 | Ordinateurs et équipements RH          |
| Interconnexion routeur | 172.16.3.0/24      | 172.16.3.1 - 172.16.3.254 | Serveurs, équipements réseau           |

---

## 3    . Exemples de Règles de Routage et Supervision
- Les équipements du sous-réseau IT (172.16.3.0/24) peuvent communiquer avec tous les autres sous-réseaux.
- Le réseau "Invités" (172.16.10.0/24) est isolé et n’a accès qu’à Internet.
- Les plages spécifiques pour la supervision (SNMP, Syslog) sont sur le dernier octet `.253` et `.254`.
