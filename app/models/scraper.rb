# require 'nokogiri'
# require 'open-uri'
# require 'pry'

# # class Scraper
# #   plant_url = 'https://www.leafenvy.co.uk/collections/all/products/butterfly-palm'

# #   html = open(plant_url).read

# #   doc = Nokogiri::HTML(html)

# #   doc.search('.custom-pdp-description-icon').each do |element|
# #   puts element.text

# # #   binding.pry
# #   end

# # #   plants = doc.css('#city').css('.browseCategoryItem').css('a')

# # end
 
# def scraper_index(plant_url = 'https://www.leafenvy.co.uk/collections/all')
# #   plant_url = 'https://www.leafenvy.co.uk/collections/all'
  
#   html = open(plant_url).read
  
#   doc = Nokogiri::HTML(html)
    
#   url_list = doc.search('.product-card a').map do |card|
#     card["href"]
#   end
#   url_list
# end

# def scrape_product(product_url, space = "Indoors")
#   html = open(product_url).read
  
#   doc = Nokogiri::HTML(html)

#   product_details = {}
#   product_details[:name] = doc.search('.product-single__title').text
#   product_details[:description] = doc.search('.custom-pdp-description').text
#   product_details[:space] = space
#   product_details[:light] = doc.search('.custom-pdp-description-icon-sun').text
#   product_details[:plant_type] = "fern"
#   product_details[:watering] = doc.search(' .custom-pdp-description-icon-water').text
#   product_details
# end
