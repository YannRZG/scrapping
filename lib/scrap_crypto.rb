require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
crypto = []
values = []

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   

all_crypto = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')

all_values = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span')

all_crypto.each do |name|
    crypto << name.text
end

all_values.each do |value|
    values << value.text
end

crypto_hash = Hash[crypto.zip values]

crypto_hash.each do |crypto, values|


    puts "#{crypto} => #{values}"
end
   






# //*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span
# //*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[5]/div/a/span





#//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div'