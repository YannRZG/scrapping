require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def all_city_email(city_url)
    page = Nokogiri::HTML(URI.open(city_url))
    email = page-xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    return email
end
binding.pry
def all_townhall_url
    page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/val-d-oise.html"))
    city_url_array = page.xpath('/table//a[@class-"lientxt"]/@href').map(&:text)
    all_url_array = city_url_array.map {|url|"https://annuatre-des-nairies.com" + url[1..-1]}
        return all_url_array
        return city_url_array
end

def all_email
    city_url_array = all_townhall_url
    emails = Array.new
    
    city_url_array.each do |url|
    city_name = url. split("/").last.gsub(".html","").capitalize
    
    email = all_city_email(url)
    emails << {city_name => emails} 
    end
        return emails 
end
