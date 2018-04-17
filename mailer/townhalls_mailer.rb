require 'json'
require 'gmail'
require 'rubygems'

def send_email_to_line(adresse, name)
    # Puts the sender email adress and password
    gmail = Gmail.connect(USER_GMAIL,PASSWORD_GMAIL)
    email = gmail.compose do
    to "#{adresse}"
    # This is the content of the message
    subject "The Hacking Project"
    body " "
        html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>
                Bonjour,
            </p>
            <p>
                Je m'appelle Jean Ducobu, je suis élève à The Hacking Project,
                une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique.
            </p> 
            <p>
                La pédagogie de notre école est celle du peer-learning, 
                où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.
                Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
            </p>
            
            <p>
                Déjà 300 personnes sont passées par The Hacking Project. Est-ce que la mairie de <b>#{name}</b> veut changer le monde avec nous ?
            </p>
            
            <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
      end
    end
email.deliver!
gmail.logout

end


def go_through_all_line
    
    file = File.read('./database/townhalls.json')
    datas = JSON.parse(file)

    # This code run the json file
    for i in 0...datas.length 
        send_email_to_line(datas[i]['email'],datas[i]['name'])
    end
end
