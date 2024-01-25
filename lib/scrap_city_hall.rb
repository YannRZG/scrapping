require 'rubygems'
require 'nokogiri'
require 'open-uri'

city_hall = []
city_mail = []

page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))

city_hall_mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
adress_city_hall = page.xpath('/html/body/div/header/section/div/div[1]/h1/small')




adress_city_hall.each do |adress|
    city_hall << adress_city_hall.text
end

city_hall_mail.each do |mail|
    city_mail << city_hall_mail.text
end

city_information = Hash[city_hall.zip city_mail]

city_information.each do |adress, mail|

    puts "#{adress} => #{mail}"
end


