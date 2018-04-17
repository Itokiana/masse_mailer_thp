require 'twitter'
require 'json'

# quelques lignes qui enregistrent les clés d'APIs
CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "CZ2FBujHYfsVrewGdhaj3w6FL"
  config.consumer_secret     = "lqZY0asvuPvBrHYGGMrPbdItWvHqj7agCCgqIC9KVU6JNRDNPP"
  config.access_token        = "986198426680483841-BoEr5IpUX6HoiSdoB2mCsgU7MvT0go9"
  config.access_token_secret = "Qx9maBrtoqIiqm5pPWbLa5e53ocn4DZGxxh4xIfHl4OGT"
end

#Méthode pour follower les utilisateurs concernés par les tweets sur la liste des communes
def follow_user
    #Lecture du fichier .json
    file = File.read('fichier.json')

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
        end
        i += 1
    end

    #Ecriture du fichir json
    File.open("fichier.json","w") do |f|
        f.write(data_hash.to_json)
    end

    #Ici, on follow les utilisateur concernés
    tab_users.each do |users|
        puts users
        CLIENT.follow(users)
    end
end

follow_user