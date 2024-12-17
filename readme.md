# Compte Rendu : Projet 1IR - Les Protocoles de l'Internet 2024-2025

## **Objectif du Projet**
Le projet vise à comprendre et maîtriser les principaux protocoles et mécanismes des réseaux Internet classiques à faible échelle, comme les réseaux domestiques ou d'entreprise. Les objectifs spécifiques sont :
- Concevoir un réseau d'entreprise en suivant une démarche incrémentale.
- Appliquer les concepts théoriques étudiés en cours à travers une mise en œuvre pratique.
- Développer des compétences en configuration réseau et en sécurité.

**Nota Bene** : Ce projet exclut la supervision des réseaux et l'utilisation de techniques spécifiques comme Ethernet.

---

## **Organisation**

### **Travail individuel**
Chaque étudiant doit :
- Concevoir et mettre en place son propre réseau sur des machines virtuelles.
- Réaliser une architecture intégrant un réseau privé et une DMZ.

### **Travail en groupe**
Les membres d’un groupe (4 étudiants) collaborent pour :
- Interconnecter leurs réseaux respectifs.
- Tester l'intégration de leurs réseaux.
- Produire un rapport détaillé des choix techniques et des observations.

#### **Répartition des outils de virtualisation**
| **Membre**         | **Outil de virtualisation utilisé** |
|---------------------|-------------------------------------|
| **Julien Couderc**  | VirtualBox                         |
| **Dylan Latapie**   | VirtualBox                         |
| **Antoine Gouzy**   | Docker                             |
| **Célian Hache**    | Docker                             |

### **Livrables**
Le rapport de groupe devra inclure :
- **Obligatoire** :
  - Un **dessin de l'architecture réseau** individuelle pour chaque membre.
  - Une **représentation de l’interconnexion des réseaux** du groupe.
  - Les **choix techniques principaux** et leur justification.
- **Recommandé** :
  - Les **difficultés rencontrées** et les solutions apportées.
  - Les **points intéressants** du projet.
- **Annexe possible** (optionnel) :
  - Scripts ou fichiers de configuration.
  - Tuto ou documentation complémentaire.
  - Une approche créative, comme un "livre dont vous êtes le héros".

---

## **Contraintes**
1. L'adressage IP pour les réseaux privés et la DMZ doit être privé. Seules les interfaces de routeurs peuvent utiliser des adresses publiques.
2. Tous les trafics réseau doivent être observables à l'aide de Wireshark.

---

## **Outils**
- **Machines Virtuelles (VMs)** :
  - VirtualBox ou tout autre outil de virtualisation (par ex. Docker).
  - Linux est recommandé comme système d’exploitation pour ses performances et compatibilités.
- **Services requis** :
  - Serveur Web (Apache2).
  - Reverse Proxy (Nginx ou équivalent).
  - Serveur DNS (Bind9).
  - Serveur DHCP (isc-dhcp-server).
  - Configuration du pare-feu avec iptables.

---

## **Évaluation**
Les critères d’évaluation incluent :
1. Démonstration du réseau individuel.
2. Présentation de l’interconnexion des réseaux du groupe.
3. Capacité à justifier les choix techniques.
4. Un rapport documentant l’architecture réseau, les tests et des recommandations pour des améliorations.

---

## **Phases du Projet**

### **Phase I : Mise en place du réseau sur les VMs (individuel)**
#### Étapes :
1. **Configuration du réseau privé** :
   - Définir le plan d'adressage.
   - Tester la communication interne avec des outils comme `ping`.
2. **Mise en place de la DMZ** :
   - Héberger des services publics (serveur DNS, serveur Web).
   - Installer Apache2 et créer une page d’accueil personnalisée.
3. **Interconnexion interne** :
   - Connecter le réseau privé à la DMZ via un routeur.

#### Questions clés :
- Faut-il utiliser le NAT entre la DMZ et le réseau privé ? Pourquoi ?
- Quels sont les étapes et caractéristiques des communications entre un client et un serveur dans la DMZ ?

---

### **Phase II : Interconnexion avec le reste du monde (en groupe)**
#### Étapes :
1. **Mise en place du routage externe** :
   - Permettre aux serveurs Web d’être accessibles depuis des entités externes.
   - Configurer les routes pour garantir la connectivité.

#### Questions clés :
- Quelles routes ajouter pour établir une communication avec le réseau externe ?
- Quels composants ne communiquent pas avec le reste du monde et pourquoi ?

---

### **Phase III : Communication entre le réseau privé et la DMZ**
#### Étapes :
1. Configuration du NAT pour permettre la communication sécurisée entre le réseau privé et les services de la DMZ.

---

### **Phase IV : Mise en place de la sécurité**
#### Étapes :
1. Définir une politique de sécurité pour protéger les différents éléments du réseau (routeur, réseau privé, DMZ).
2. Configurer un pare-feu à l’aide d’iptables pour appliquer ces politiques.

#### Questions clés :
- Comment l'état d'une connexion TCP aide-t-il au filtrage des paquets ?

---

### **Phase V : Configuration automatique**
#### Étapes :
1. Déployer un serveur DHCP pour automatiser la configuration des machines du réseau privé.

---

### **Phase VI : Mise en place d’un reverse proxy**
#### Étapes :
1. Remplacer le NAT par un reverse proxy pour simplifier l'accès aux services Web de la DMZ.

---

### **Phase VII : Configuration DNS**
#### Étapes :
1. Mettre en place un système DNS pour remplacer les adresses IP par des noms de domaine.
2. Configurer un serveur DNS Bind9.

#### Questions clés :
- Quelles alternatives au DNS dépendant des FAI peuvent être envisagées pour un réseau d'entreprise ?

---

## **Compétences Développées**
- Création et gestion de réseaux virtuels.
- Configuration et optimisation des services réseau (NAT, DHCP, DNS).
- Sécurisation avec pare-feu et gestion des politiques de sécurité.
- Travail en groupe pour l’interconnexion et le routage.

---

## **Livrables**
1. **Rapport** : Document comprenant :
   - Les architectures réseau individuelles et l’interconnexion de groupe.
   - Les choix techniques, les défis rencontrés et les solutions trouvées.
   - Observations et tests réalisés.
2. **Scripts et configurations** : Fichiers nécessaires pour reproduire les configurations.
3. **Tutoriels ou annexes créatives** : Guides explicatifs pour les étapes du projet.

---

## **Conclusion**
Le projet "1IR - Les Protocoles de l'Internet" offre une approche complète pour relier la théorie à la pratique, en explorant à la fois les aspects techniques et collaboratifs de la mise en œuvre d'un réseau d'entreprise.
