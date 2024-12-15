## **Serveur DNS**

### 1. Installation d’un serveur DNS (BIND9)
```bash
sudo apt update
sudo apt install bind9 bind9-utils
```

### 2. Configuration du domaine

1. **Modifier le fichier de configuration principal**
Ouvrez le fichier `/etc/bind/named.conf.local` :
```bash
sudo nano /etc/bind/named.conf.local
```

2. **Définir une zone DNS pour le domaine**
Ajoutez une configuration pour votre domaine (ex. : `latapie.coupie.com`) :
```bash
zone "latapie.coupie.com" {
      type master;
      file "/etc/bind/db.latapie.coupie.com";
};
```

3. **Créer le fichier de zone DNS**
Copiez un fichier modèle et éditez-le :
```bash
sudo cp /etc/bind/db.local /etc/bind/db.latapie.coupie.com
sudo nano /etc/bind/db.latapie.coupie.com
```

4. **Configurer les enregistrements DNS**
Exemple de configuration :
```
;
; Fichier de zone pour latapie.coupie.com
;
$TTL    604800
@       IN      SOA     ns1.latapie.coupie.com. admin.latapie.coupie.com. (
                     1         ; Serial
                     604800    ; Refresh
                     86400     ; Retry
                     2419200   ; Expire
                     604800 )  ; Negative Cache TTL
;
@       IN      NS      ns1.latapie.coupie.com.
ns1     IN      A       192.168.1.10
www     IN      A       192.168.1.12
```

5. **Définir l'interface à utiliser**
Ouvrez le fichier `/etc/bind/named.conf.options` :
```bash
sudo nano /etc/bind/named.conf.options
```
Ajoutez ou modifiez la section `INTERFACE` :
```bash
INTERFACE="enp0s8";
```

6. **Redémarrer BIND9**
```bash
sudo systemctl restart bind9
```

7. **Tester la configuration DNS**
Utilisez `dig` ou `nslookup` pour vérifier :
```bash
dig @192.168.1.1 www.mondomaine.local
```

## **Étendre le service à une solution globale**

1. **Configurer des redirections DNS**
   Si vous souhaitez intégrer votre serveur DNS dans une structure globale, configurez-le pour rediriger les requêtes non locales :
   - Ouvrez `/etc/bind/named.conf.options` :
     ```bash
     sudo nano /etc/bind/named.conf.options
     ```
   - Ajoutez ou modifiez la section `forwarders` :
     ```bash
     options {
         forwarders {
             8.8.8.8;  // Google DNS
             8.8.4.4;  // Google DNS
         };
         dnssec-validation auto;
     };
     ```

3. **Tester les redirections globales :**
   Vérifiez qu’un client peut résoudre des noms locaux et des noms globaux.