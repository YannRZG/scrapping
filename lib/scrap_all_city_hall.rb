require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

city_hall = []
city_mail = []

page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

every_city_hall = page.xpath('//*[@class="lientxt"]')
every_city_mail = page.xpath('//td[contains(text(), "@")]')


every_city_hall.each do |city|
    city_hall << every_city_hall.text
end

every_city_mail.each do |mail|
    city_mail << every_city_mail.text
end


city_information = Hash[city_hall.zip city_mail]

city_information.each do |city, mail|

    puts "#{city} => #{mail}"
end






# /html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]
# /html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]