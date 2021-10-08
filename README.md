Project stage

##Pour installer le projet : 

1. Cloner le projet sur votre machine
```bash
git clone https://github.com/ValerianGuzelbaba/GestForm.git
```

2. Créer une bdd Mysql en local et importer le fichier `db/schema/gestform.sql`

3. Modifier les paramètres de la bdd dans `config/appConfig.php`
```


4. Installez les dépendances de Composer.

```bash
composer install
```

5. Configurer le fichier `./phinx.php`


##Pour lancer l'application :

```bash
cd [my-app-name]
composer start
```

On peut aussi lancer l'application avec `docker` en utilisant `docker-compose` :
```bash
cd [my-app-name]
docker-compose up -d
```
