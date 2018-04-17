require 'twitter'
require 'json'

# quelques lignes qui enregistrent les clés d'APIs
CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

#Méthode pour follower les utilisateurs concernés par les tweets sur la liste des communes
def follow_user
    #Lecture du fichier .json
    file = File.read('./database/townhalls.json')

    #Parser le fichier json
    data_hash = JSON.parse(file)

    #Initialisation du hash my_hash
    tab_users = []

    #On parcour le tableau reçu dans data_hash | Faire des recherches des noms des communes sur twitter
    #Récupérer les utilisateurs concerné par le tweet
    i = 0
    data_hash.each do |handle|
        CLIENT.search("@#{handle['name']}").take(1).each do |tweet|
            tab_users << tweet.user.screen_name
            data_hash[i]['handle_twitter'] = '@' + tweet.user.screen_name
            puts "Mairie #{data_hash[i]['name']} => #{tweet.user.screen_name}\npublication => #{tweet.text}"
        end
        i += 1
    end

    #Ecriture du fichir json
    File.open("./database/townhalls.json","w") do |f|
        f.write(data_hash.to_json)
    end

    #Ici, on follow les utilisateur concernés
    tab_users.each do |users|
        puts users
        CLIENT.follow(users)
    end
end