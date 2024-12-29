# Compte Rendu : Projet 1IR - Les Protocoles de l'Internet 2024-2025

## **Objectif du Projet**
Le projet vise à comprendre et maîtriser les principaux protocoles et mécanismes des réseaux Internet classiques à faible échelle, comme les réseaux domestiques ou d'entreprise. Les objectifs spécifiques sont :
- Concevoir un réseau d'entreprise en suivant une démarche incrémentale.
- Appliquer les concepts théoriques étudiés en cours à travers une mise en œuvre pratique.
- Développer des compétences en configuration réseau et en sécurité.

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


## **1. Segmentation réseau**

Pour garantir une sécurité et une organisation optimales, le réseau a été segmenté en trois parties principales :

### **Réseau privé**
Ce réseau est dédié aux machines internes de l’entreprise (postes utilisateurs, serveurs internes non accessibles de l'extérieur). Il permet une communication sécurisée entre les utilisateurs et les ressources internes, avec une protection contre les accès extérieurs non autorisés.

- **Rôle** : Sécuriser les données internes.
- **Configuration** : Adresses IP attribuées dynamiquement via un serveur DHCP.
- **Sécurité** : Règles de pare-feu pour empêcher les accès non autorisés venant de la DMZ ou de l'extérieur.

### **DMZ (Zone Démilitarisée)**
La DMZ héberge les services accessibles depuis l'extérieur, comme un site web, un serveur DNS, ou des applications spécifiques. Cela limite les risques de compromission des systèmes internes si un service public est attaqué.

- **Rôle** : Héberger des services publics sans exposer le réseau privé.
- **Configuration** : Adresses IP fixes pour les serveurs (DNS, web, NGINX).
- **Sécurité** : Pare-feu configuré pour limiter les connexions aux seuls ports nécessaires (HTTP, HTTPS, DNS).

### **Interconnexion routeur**
Cette partie connecte les différentes segments (réseau privé, DMZ) entre eux et avec l’extérieur. Elle joue un rôle crucial dans la gestion des flux réseau et le filtrage des paquets.

- **Rôle** : Centraliser le routage entre les segments et l'extérieur.
- **Configuration** : Routes statiques ou dynamiques en fonction des besoins.
- **Sécurité** : Règles NAT pour masquer les adresses internes.

## **2. Plages d'adresses**

Pour garantir une gestion simplifiée des adresses IP et éviter tout conflit, le réseau principal a été subdivisé en sous-réseaux.

| **Segment**             | **Sous-réseau**    | **Masque**      | **Plage d'adresses**   | **Utilisation**                                           |
|-------------------------|--------------------|-----------------|------------------------|-----------------------------------------------------------|
| Réseau privé            | 192.168.1.0/24       | 255.255.255.0   | 192.168.1.1 - 192.168.1.254  | Station de travail                 |
| DMZ                     | 192.168.2.0/24       | 255.255.255.0   | 192.168.2.1 - 192.168.2.254  | Hébergement de services publics.                         |
| Interconnexion routeur  | 192.168.3.0/24       | 255.255.255.0   | 192.168.3.1 - 192.168.3.254  | Interfaces des routeurs entre segments.                  |

Chaque sous-réseau est isolé des autres via des règles de pare-feu, limitant les communications aux seuls flux nécessaires.

## **3. Détails d’adressage**

### **Réseau privé**
- **Passerelle** : 192.168.1.1 (assurée par le routeur interne).
- **Adresses dynamiques (DHCP)** : Réservées pour les postes utilisateurs (192.168.1.10 à 192.168.1.210).
- **Configuration** : 
  - Serveur DHCP sur le routeur interne.
  - Attribution dynamique pour simplifier la gestion des postes utilisateurs.

### **DMZ**
- **Passerelle** : 192.168.2.1.
- **Adresses fixes pour les serveurs** :
  - Serveur Web : 192.168.2.2.
  - Serveur DNS : 192.168.2.3.
  - Serveur NGINX : 192.168.2.4.
- **Configuration** : Adresses IP configurées manuellement pour garantir une disponibilité constante.

### **Interconnexion routeur**
- **Interfaces des routeurs** :
  - Routeur interne (10.0.0.5) : Relie le réseau privé et la DMZ.
  - Routeur externe 1 (10.0.0.2), 2 (10.0.0.3), et 3 (10.0.0.4) : Relient le réseau interne au WAN.

## **4. Architecture du réseau**

Nous avons choisi une architecture avec un routeur central interne faisant la liaison entre le réseau privé, la DMZ, et le réseau externe avec les routeurs de Célian, Antoine et Dylan.

Voici le schéma de l'architecture réseau que nous avons mis en place :

![Architecture du réseau](assets/architecture-reseau.png)

## **5. Configuration des équipements**

### **Routeur**
Le routeur interne joue un rôle clé :
1. **Activer le routage IP** :
   ```
   net.ipv4.ip_forward=1
   ```
2. **Configurer le NAT** pour permettre la communication entre les réseaux internes et externes.
3. **Appliquer les règles iptables** pour filtrer les paquets en fonction des segments.

### **Serveurs**
Les configurations des serveurs DNS, Web, et NGINX incluent :
- Installation et configuration des services.
- Tests pour vérifier leur disponibilité depuis l'extérieur (via la DMZ).

### **Postes utilisateurs**
Les postes du réseau privé sont configurés pour accéder aux ressources internes et externes via la passerelle 10.1.1.1.

## **6. Principaux choix effectués**

1. **Architecture segmentée** pour limiter les risques liés à des attaques externes.
2. **Utilisation de sous-réseaux** pour simplifier la gestion des adresses IP.
3. **Configuration manuelle des serveurs** pour garantir la stabilité.
4. **Sécurisation via iptables** pour contrôler les flux réseau.
5. **DNS et reverse proxy** pour gérer efficacement les noms de domaine et rediriger les requêtes.

## **7. Principales difficultés rencontrées**

1. **Configuration des règles iptables** : Compréhension et implémentation des règles complexes pour NAT et filtrage.
2. **Dépannage des problèmes de connectivité** : Résolution des conflits IP et des erreurs de routage.
3. **Mise en place des services (NGINX, DNS)** : Ajustements pour garantir leur bon fonctionnement dans un environnement segmenté.

## **8. Solutions apportées**

1. **Documentation et tests réguliers** : Identification et correction des erreurs lors de chaque étape.
2. **Utilisation de fichiers de configuration standards** : Basés sur des guides pour éviter les erreurs courantes.
3. **Collaboration** : Discussions en groupe pour résoudre rapidement les problèmes rencontrés.

## **9. Points intéressants**

1. **Gain en sécurité et en organisation** grâce à la segmentation du réseau.
2. **Simplification de la gestion des IP** avec l'usage du DHCP et des adresses fixes.
3. **Montée en compétences** sur des outils réseau avancés comme BIND9 et NGINX.

## **10. Annexes**
- **Scripts iptables** : Voir [ci-dessus](#configuration-des-équipements).
- **Fichiers de configuration (DHCP, DNS, etc.)** : Inclus en annexe.
- **Tutoriels** :
  - Guide pas à pas pour installer et configurer les services principaux.
  - Explications pour tester les règles et les configurations.
