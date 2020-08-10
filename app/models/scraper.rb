require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

    def scrape_city_urls 
        idaho_url = 'http://www.museumsusa.org/museums/?k=1271400%2cState%3aID%3bDirectoryID%3a200454'
        html = open(idaho_url)
        doc = Nokogiri::HTML(html)

        cities = doc.css('#city').css('.browseCategoryItem').css('a')

        city_urls = []
        cities.each do |city|
            url = city.attribute('href').value
            city_urls << url
            
        end
        scrape_city_pages(city_urls)
    end

    def scrape_city_pages(city_urls)
        city_urls.each do |city_url|
            url = "http://www.museumsusa.org#{city_url}"
            html = open(url)
            doc = Nokogiri::HTML(html)

            
        end
    end
end

scrape = Scraper.new
scrape.scrape_city_urls