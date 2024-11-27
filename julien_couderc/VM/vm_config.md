# Changer le hostname d'une VM sous Linux

Le changement du hostname d'une machine virtuelle permet de lui attribuer un nom unique pour l'identification dans le réseau. Cette procédure peut être effectuée en ligne de commande en utilisant l'outil `hostnamectl`.

## Étapes pour changer le hostname :

1. **Ouvrir un terminal**
   
   Connectez-vous à la machine virtuelle avec un utilisateur ayant des privilèges `sudo` ou `root`.

2. **Vérifier l'actuel hostname**
   
   Avant de changer le hostname, vous pouvez vérifier l'hostname actuel en exécutant la commande suivante :
   ```bash
   hostnamectl
   ```

3. **Commande à éxécuter**

   ```bash
   sudo hostnamectl set-hostname <newhostname>
