# kata-manga

## Pré-requit

Pour commencer, il vous faudra les logiciels suivant :

- git
- docker
- docker-compose
- curl (Pour les tests)

Puis, il vous faudra cloner le projet sur votre machine : `git clone git@github.com:nicolasreymond/kata-manga.git`


Ensuite, renommez le fichié `conparam_template.php` en `conparam.php` dans le dossier `cd kata-manga/docker/api/object/condef` et y mettre vos infos concernant votre base de données.

Ensuite naviguer dans le dossier contenant le fichier 'docker-compose.yml' : `cd kata-manga/docker`

Et enfin lancer la commande : `docker-compose up --build`

## Application

Aller sur `http://localhost:1337/web` and enjoy!


## API

Pour voir les données de l'API, aller sur `http://localhost:1337/api/object/manga`.

## Swagger

Pour tester l'API, aller sur `http://localhost:1337`.
