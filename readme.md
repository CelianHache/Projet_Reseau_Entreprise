# Compte Rendu : Projet 1IR - Les Protocoles de l'Internet 2024-2025

## **Objectif du Projet**
Le projet a pour objectif de comprendre les principaux protocoles et mécanismes rencontrés dans les réseaux Internet classiques à faible échelle (réseaux domestiques, réseaux d'entreprise, etc.). Il s'agit de :
- Mettre en place un réseau d'entreprise avec une approche incrémentale.
- Illustrer les notions théoriques vues en cours par une application pratique.
- Acquérir des compétences techniques en configuration réseau et sécurité.

**Nota Bene** : La supervision réseau et les techniques basées sur des technologies spécifiques comme Ethernet ne sont pas couvertes par ce projet.

---

## **Organisation**

### **Travail individuel**
Chaque étudiant est chargé de concevoir et de mettre en place un réseau d'entreprise sur des machines virtuelles, en respectant les contraintes spécifiées dans le projet.

### **Travail en groupe**
Les étudiants collaborent en groupes de **4 personnes** pour interconnecter leurs réseaux respectifs. Cela inclut :
- La réflexion sur l'adressage public et la topologie de l'interconnexion.
- La mise en place de cette interconnexion.
- Les tests d'intégration entre les réseaux des différents membres.

#### **Répartition des outils de virtualisation**
| **Membre**         | **Outil de virtualisation utilisé** |
|---------------------|-------------------------------------|
| **Julien Couderc**  | VirtualBox                         |
| **Dylan Latapie**   | VirtualBox                         |
| **Antoine Gouzy**   | Docker                             |
| **Célian Hache**    | Docker                             |

### **Livrables**
Chaque groupe doit fournir un rapport au format libre (Git, Wiki, site Web ou autre) détaillant les éléments suivants :
- L'**architecture du réseau** mise en place.
- Les **tests réalisés**, accompagnés d'observations et de résultats.
- Des **recommandations** pour améliorer les solutions proposées ou étendre leur utilisation.



---

## **Contraintes**
1. Les adresses du réseau privé et de la DMZ doivent être privées. Seules les interfaces de routeurs disposent d'adresses publiques.
2. Tous les trafics doivent être observables via Wireshark.

---

## **Outils**
- **Machines Virtuelles (VMs)** :
  - Logiciel recommandé : VirtualBox.
  - Système d'exploitation : Linux (ou tout autre OS léger permettant l'exécution simultanée de 3-4 VMs).
- **Services et logiciels requis** :
  - Serveur Web (Apache2).
  - Reverse Proxy (Nginx ou équivalent).
  - Serveur DNS (Bind9).
  - Serveur DHCP (isc-dhcp-server).
  - Pare-feu (iptables).

---

## **Évaluation**
L'évaluation repose sur plusieurs critères :
1. Démonstration du réseau mis en place individuellement.
2. Présentation de l'interconnexion des réseaux au niveau du groupe.
3. Évaluation de l'autonomie et de la motivation.
4. Rapport détaillé comprenant :
   - Architecture réseau.
   - Tests effectués.
   - Suggestions d'amélioration.

---

## **Phases du Projet**

### **Phase I : Mise en place du réseau sur les VMs (individuel)**
#### Étapes :
1. **Réseau privé** : Configuration d'un plan d'adressage logique et physique.
   - Tests de communication (ping).
   - Configuration des interfaces réseau sur les VMs.
2. **Réseau public (DMZ)** : Mise en place d'une DMZ hébergeant les services publics comme le DNS et le serveur Web.
   - Installation d'Apache2 avec une page d'accueil personnalisée.
3. **Interconnexion interne** : Liaison entre le réseau privé et la DMZ via un routeur.

#### Questions à explorer :
- Faut-il utiliser le NAT entre la DMZ et le réseau privé ? Pourquoi ?
- Quels sont les étapes et caractéristiques des communications entre un client Web et un serveur DMZ ?

---

### **Phase II : Interconnexion avec le reste du monde (en groupe)**
#### Étapes :
1. **Routage externe** :
   - Permettre la consultation des serveurs Web des réseaux publics depuis l'extérieur.
   - Configurer les routes pour assurer la connectivité entre les VMs et le réseau réel.

#### Questions à explorer :
- Quelles routes doivent être ajoutées pour le routage externe ?
- Quelles parties du réseau ne communiquent pas et pourquoi ?

---

### **Phase III : Communication privée avec les serveurs web**
#### Étapes :
1. Utilisation de NAT pour permettre au réseau privé de communiquer avec les serveurs externes.

---

### **Phase IV : Mise en place de la sécurité**
#### Étapes :
1. Définition et application d'une politique de sécurité :
   - Configuration d'un pare-feu (iptables).
   - Protection du routeur, des réseaux, et des machines.

#### Questions à explorer :
- En quoi l’état d’une connexion TCP est-il utile pour le filtrage ?

---

### **Phase V : Configuration automatique**
#### Étapes :
1. Mise en place d’un serveur DHCP sur le réseau privé pour automatiser la configuration réseau des machines.

---

### **Phase VI : Mise en place d’un reverse proxy**
#### Étapes :
1. Configurer un reverse proxy pour remplacer le NAT pour les communications web.

---

### **Phase VII : Configuration DNS**
#### Étapes :
1. Mise en place d’un espace de nommage (système DNS).
2. Installation et configuration d’un serveur DNS.

#### Questions à explorer :
- Quelles sont les alternatives à un système de nommage dépendant des FAI ?

---

## **Compétences Développées**
- Configuration réseau sur VMs.
- Compréhension des protocoles DNS, DHCP, NAT, TCP/IP.
- Sécurisation réseau avec iptables.
- Mise en œuvre d'un reverse proxy.
- Collaboration en groupe pour des architectures distribuées.

---

## **Livrables**
1. **Rapport** : Document détaillant l’architecture réseau, les configurations, les tests et les observations.
2. **Démo** : Présentation des réseaux individuels et de l’interconnexion du groupe.
3. **Code/Configurations** : Scripts ou fichiers nécessaires à la reproduction de l’environnement.

---

## **Conclusion**
Le projet "1IR - Les Protocoles de l'Internet" offre une opportunité de relier théorie et pratique en créant un réseau fonctionnel, tout en développant des compétences techniques et collaboratives essentielles.

