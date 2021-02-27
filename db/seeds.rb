require 'nokogiri'
require 'open-uri'
require 'pry'

puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating Plants..."
10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "hello12345"
  )
  puts "Created #{user.email}"
end

# def scraper_index_indoor(plant_url = 'https://www.patchplants.com/gb/en/w/product-type/plants/environment/indoor/')
#   html = open(plant_url).read
    
#   doc = Nokogiri::HTML(html)
  
#   base_url = "https://www.patchplants.com"

#   url_list = doc.search('.gallery__item--listing a').map do |card|
#     base_url + card["href"]
#   end
#   url_list
# end
  
# def scrape_product_indoor(product_url, space = "Indoors")
#   html = open(product_url).read
    
#   doc = Nokogiri::HTML(html)
  
#   product_details = {}
#   product_details[:name] = "hello plants"
#   product_details[:description] = doc.search('.quick-facts-section__about-text').text
#   product_details[:space] = space
#   product_details[:light] = "doc.search('.hero-space__highlight-text').text"
#   product_details[:plant_type] = "fern"
#   product_details[:watering] = "test"
#   product_details
# end
  
# product_url_list = scraper_index_indoor()

# product_url_list.each do |url|
#   product_details = scrape_product_indoor(url) 
#   plant = Plant.new(product_details)
#   plant.save!
#   puts "Created Indoor Plant #{plant.id} has been created"
# end
   
# puts "Finished!"

def scraper_index(plant_url = 'https://www.leafenvy.co.uk/collections/all')
  html = open(plant_url).read
  
  doc = Nokogiri::HTML(html)

  base_url = "https://www.leafenvy.co.uk"

    
  url_list = doc.search('.product-card a').map do |card|
    base_url + card["href"]
  end
  url_list
end

def scrape_product(product_url, space = "Indoors")
  html = open(product_url).read
  
  doc = Nokogiri::HTML(html)

  product_details = {}
  product_details[:name] = doc.search('.product-single__title').text
  product_details[:description] = doc.search('.custom-pdp-description').text
  product_details[:space] = space
  product_details[:light] = doc.search('.custom-pdp-description-icon-sun').text
  product_details[:plant_type] = "fern"
  product_details[:watering] = doc.search(' .custom-pdp-description-icon-water').text
  product_details
end

product_url_list = scraper_index()
  product_url_list.take(10).each do |url|
    product_details = scrape_product(url) 
    plant = Plant.new(product_details)
    plant.save!
    puts "Created Plant #{plant.id} has been created"
  end

puts "Finished!"
