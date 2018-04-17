require 'open-uri'
require 'nokogiri'
require 'json'




# Methode recuperer les emails
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Acceder à la page
    email = doc.css(".tr-last")[3].text.split(" ")[2] # Scraping des données
    email
end

def get_all_the_urls_of_mairie(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Acceder à la page
    urls = []
    get_urls = doc.css("a[class=lientxt]") # Scrap des datas
    get_urls.each{|link| urls.push("http://annuaire-des-mairies.com"+link['href'][1..-1])} # On push les datas dans urls
    urls
end

# Methode pour tester le tout
def get_email(dpt, url)
    mairies = []
    tab_link = get_all_the_urls_of_mairie(url)# appel de la methode pour les urls
    i = 0
    tab_link.each do 
        |link|
        mairie = Nokogiri::HTML(open(link)).css('main h1')[0].text.split(" ")[0] # On scrap le nom
        # On push le tout dans mairies
        mairies.push({
            :name => mairie,
            :email => get_the_email_of_a_townhal_from_its_webpage(link),
            :departement => dpt
        })
        
        puts mairies
    end
    puts "#################################################################################################"
    puts "                          RESULTAT"
    puts "#################################################################################################"
    mairies
end



def save_to_json
    t1 = get_email("VAR","http://www.annuaire-des-mairies.com/var.html")
    t2 = get_email("VAUCLUSE","http://www.annuaire-des-mairies.com/vaucluse.html")
    t3 = get_email("DOUBS","http://www.annuaire-des-mairies.com/doubs.html")
    
    tab = []
    t1.each do |x|
        tab.push(x)
    end
    t2.each do |x|
        tab.push(x)
    end
    t3.each do |x|
        tab.push(x)
    end
    
    
    File.open("./database/townhalls.json","a") do |f|
        f.write(tab.to_json)
    end
    puts "Save data to townhalls.json OK"
end



