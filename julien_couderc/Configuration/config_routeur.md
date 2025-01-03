# Paramétrage du routeur

## Interfaces

- **enp0s3** : Interface NAT (connectée à Internet ou à un réseau extérieur).
- **enp0s8** : Interface pour le LAN privé.
- **enp0s9** : Interface pour la DMZ.

## Procédure

### 1. **Activer le routage IP**
Pour activer l'IP forwarding sur la machine et rendre cette configuration permanente :

Editez `/etc/sysctl.conf` et ajoutez :
```plaintext
net.ipv4.ip_forward=1
```

Rechargez les paramètres :
```bash
sudo sysctl -p
```

### 2. **Configurer le NAT**

#### Pour l'accès Internet

Utilisez `iptables` pour configurer le NAT sur l'interface NAT **enp0s3**.

##### Ajouter une règle NAT (masquerading) :
```bash
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
```

##### Autoriser le trafic entre les interfaces :
- Autoriser les paquets du LAN privé (enp0s8) à sortir vers Internet via NAT :
  ```bash
  sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
  ```
- Autoriser les paquets de retour depuis Internet vers le LAN privé :
  ```bash
  sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT
  ```
- Autoriser les paquets de la DMZ (enp0s9) à sortir vers Internet via NAT :
  ```bash
  sudo iptables -A FORWARD -i enp0s9 -o enp0s3 -j ACCEPT
  ```
- Autoriser les paquets de retour depuis Internet vers la DMZ :
  ```bash
  sudo iptables -A FORWARD -i enp0s3 -o enp0s9 -m state --state RELATED,ESTABLISHED -j ACCEPT
  ```

#### Pour l'interconnexion de réseaux

##### Suppression de toutes les iptables
```bash
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
```

##### Règles NAT (PREROUTING and POSTROUTING)
```bash
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 80 -j DNAT --to-destination 192.168.2.2
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 443 -j DNAT --to-destination 192.168.2.2
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 53 -j DNAT --to-destination 192.168.2.3
sudo iptables -t nat -A PREROUTING -i enp0s3 -p udp --dport 53 -j DNAT --to-destination 192.168.2.3
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
 ```

##### Politiques par défaut
```bash
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
```

##### Règles localhost
```bash
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
```

##### Règles FORWARD
###### LAN ↔ EXT
```bash
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT
```

###### DMZ ↔ EXT
```bash
sudo iptables -A FORWARD -i enp0s9 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -i enp0s3 -o enp0s9 -j ACCEPT
```

###### LAN ↔ DMZ
```bash
sudo iptables -A FORWARD -i enp0s8 -o enp0s9 -j ACCEPT
sudo iptables -A FORWARD -i enp0s9 -o enp0s8 -j ACCEPT
```

###### Autorisation des packets ICMP
```bash
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT
```

##### Enregistrer les règles iptables
```bash
sudo netfilter-persistent save
```
OU
```bash
sudo apt install iptables-persistent
```

### 3. **Configurer les routes**

#### Route par défaut :
Les machines du LAN privé et de la DMZ doivent avoir leur passerelle configurée pour pointer vers la machine avec ces interfaces :
- **LAN privé** : Passerelle → IP de l’interface `enp0s8`.
- **DMZ** : Passerelle → IP de l’interface `enp0s9`.

#### Si vous configurez les routes manuellement :
- Sur une machine du LAN privé :
  ```bash
  ip route add default via <IP_enp0s8>
  ```
- Sur une machine de la DMZ :
  ```bash
  ip route add default via <IP_enp0s9>
  ```

---

### 4. **Sauvegarder les règles iptables**

Pour rendre les règles `iptables` persistantes après un redémarrage, installez le package `iptables-persistent` :
```bash
sudo apt install iptables-persistent
```

Sauvegardez les règles actuelles :
```bash
sudo iptables-save > /etc/iptables/rules.v4
```

### 5. **Tester la configuration**

#### Depuis une machine du LAN privé :
1. Pinger l’interface LAN de la passerelle (`enp0s8`) :
   ```bash
   ping <IP_enp0s8>
   ```
2. Tester l'accès Internet :
   ```bash
   ping <IP_machine_DMZ>
   ```

#### Depuis une machine de la DMZ :
1. Pinger l’interface DMZ de la passerelle (`enp0s9`) :
   ```bash
   ping <IP_enp0s9>
   ```
2. Tester l'accès Internet :
   ```bash
   ping <IP_machine_LAN_privé>
   ```

Si tout fonctionne correctement :
- Les machines du LAN privé et de la DMZ devraient pouvoir accéder à Internet (ou au réseau d'une autre personne).
- Les machines du LAN privé et de la DMZ devraient pouvoir communiquer entre elles.
- Les machines externes devraient pouvoir accéder aux services exposés sur la DMZ.
- Les machines du LAN privé ne devraient pas être accessibles depuis l'extérieur.