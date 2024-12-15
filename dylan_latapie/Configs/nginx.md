### Configuration avec Nginx

#### 1. Installer Nginx
```bash
sudo apt update
sudo apt install nginx
```

#### 2. Configurer le reverse proxy
1. **Modifier le fichier de configuration Nginx pour le reverse proxy :**
```bash
sudo nano /etc/nginx/sites-available/default
```

2. **Ajouter la configuration :**
Modifiez ou remplacez la configuration par défaut par celle-ci :
```nginx
server {
      listen 80;

      server_name _;

      location / {
         proxy_pass http://192.168.1.11;
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      }
}
```

3. **Vérifier la configuration et redémarrer Nginx :**
```bash
sudo nginx -t
sudo systemctl restart nginx
```

### 3 : Test et validation
1. **Accéder au site via le reverse proxy :**
   Depuis un navigateur, saisissez l'IP du serveur NGINX (ex. : `10.1.2.12`).
2. **Vérifier les logs du reverse proxy :**
   - **Nginx** : `/var/log/nginx/access.log`
   - **Apache** : `/var/log/apache2/access.log`
3. **Confirmer que le reverse proxy redirige correctement les requêtes.**