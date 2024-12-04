### 4. Activer le routage IP

Pour activer le routage IP sur le serveur Ubuntu (permettre au serveur de faire le routage entre les interfaces), modifier le fichier `/etc/sysctl.conf` et décommenter ou ajouter la ligne suivante :

```bash
net.ipv4.ip_forward=1
```

Appliquer la modification avec la commande suivante :

```bash
sudo sysctl -p
```

### 5. Configurer les règles de pare-feu avec `ufw` (Uncomplicated Firewall)

Installer et configurer `ufw` pour permettre le routage et protéger le réseau.

```bash
sudo apt update
sudo apt install ufw
```

Activer les règles de routage entre les interfaces :

```bash
# Permettre les connexions entre les interfaces internes
sudo ufw allow from 10.1.1.0/24 to 10.1.2.0/24
sudo ufw allow from 10.1.2.0/24 to 10.1.1.0/24

# Permettre la connexion entre l'externe et la DMZ (ou LAN si nécessaire)
sudo ufw allow from 10.0.0.0/24 to 10.1.2.0/24
sudo ufw allow from 10.0.0.0/24 to 10.1.1.0/24
```

Activer le pare-feu :

```bash
sudo ufw enable
```

### 6. Configurer le NAT pour la sortie sur l'interface externe

Pour permettre aux clients du LAN ou de la DMZ d'accéder à Internet via le routeur (NAT), ajouter une règle de masquerade pour l'interface externe. Utiliser la commande suivante pour activer cette règle avec `iptables` :

```bash
sudo iptables -t nat -A POSTROUTING -o enp0s5 -j MASQUERADE
```

Si la règle doit être persistante après un redémarrage, installer le paquet `iptables-persistent` :

```bash
sudo apt install iptables-persistent
```

Lors de l'installation, choisir de sauvegarder les règles `iptables` en répondant "Oui".

### 7. Vérification de la configuration

Vérifier que le routage fonctionne correctement en affichant les routes avec la commande suivante :

```bash
ip route
```

Vérifier la connectivité entre les différentes interfaces du réseau en utilisant la commande `ping`.

### 8. Autres considérations

- Vérifier que le routeur externe (10.0.0.1) est configuré pour accepter et acheminer les paquets venant du serveur.
- Pour les clients du LAN ou de la DMZ, configurer leurs passerelles par défaut avec l'IP de l'interface correspondant à leur réseau sur le serveur Ubuntu (respectivement 10.1.1.1 et 10.1.2.1).
