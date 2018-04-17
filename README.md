# Projet thp s3 d2
## Installation
- Lancer:
```shell
bundle install
```
- Puis, créer et configurer un fichier **.env**, puis le mettre à la racine du projet:
```shell
USER_GMAIL=exemple@gmail.com
PASSWORD_GMAIL=motdepasse
CONSUMER_KEY=votreconsumerkey
CONSUMER_SECRET=votreconsumersecret
ACCESS_TOKEN=votreaccesstoken
ACCESS_TOKEN_SECRET=votreaccesstokensecret
```
- Lancer :
```shell
ruby index.rb
```
## L'équipe Madagascar
1.   Itokiana :                          
    Section: Regrouper les trois scripts, creer le fichier **Gemfile**,**.env**, creer le point d'acces **index.rb** qui permet de lancer l'application.            
    Slack => **@itokiana73**,           
    Github => **itokiana**
2.   Lova:           
    Section: Creer le script Scrapping de donnees           
    Slack => **@Lovarazafimah**,             
    Github => **lovatianamahefason**
2.   Ando:           
    Section: Creer le script qui permet d'envoyer l'email               
    Slack => **@Ando**,              
    Github => **andriamalala5056**
2.   Andry:              
    Section: Creer le script qui permet de creer un bot pour twitter             
    Slack => **@Andry**,                 
    Github => **andryhajanirina**

## Arborescence du projet
```shell
masse_mailer
    |- database
    |---|- townhalls.json
    |- mailer
    |---|- townhalls_mailer.rb
    |- scrapper
    |---|- townhalls_scrapper.rb
    |- twitter
    |---|- townhalls_twitter.rb
    |- README.md
    |- index.rb
    |- Gemfile
    |- .env
```
- **townhalls.json**: permet de stocker les donnees venants de chaque mairie.
- **townhalls_mailer.rb**: permet d'envoyer des emails en masse vers l'adresse de chaque mairie
- **townhalls_scrapper.rb**: permet de scrapper les communes, les noms de mairie ainsi que leurs emails du site [http://annuaire-des-mairies.com](http://annuaire-des-mairies.com).
- **townhalls_twitter.rb**: permet de recuperer les twitts par rapport au nom de chaque mairie pour ensuite stocker le premier resultat handle Twitter dans **townhalls.json** et de faire un follow sur chaque handle Twitter obtenu.
- **README.md**: contient les informations concernant le projet.
- **index.rb**: permet de lancer le projet.
- **Gemfile**: contient tout les gems necessaire pour faire fonctionner le projet(un coup de **bundle install**).
- **.env**: contient des informations sensibles tels que les logins gmail, consumer key,... indispensable pour le projet.
