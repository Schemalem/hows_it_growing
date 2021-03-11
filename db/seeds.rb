require 'nokogiri'
require 'open-uri'
# require 'pry'

puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating Plants..."
10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "hello12345",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Hipster.words
  )
  puts "Created #{user.email}"
end

def scraper_index(plant_url = 'https://www.leafenvy.co.uk/collections/all')
  html = open(plant_url).read
  doc = Nokogiri::HTML(html)
  base_url = "https://www.leafenvy.co.uk"

  url_list = doc.search('.product-card a').map do |card|
    base_url + card["href"]
  end

  url_list
end

def scrape_product(plant_url, space = "Indoors")
  html = open(plant_url).read
  doc = Nokogiri::HTML(html)

  product_details = {}
  elements = doc.search('li.custom-pdp-description-icon-tip')
  if elements&.first&.text == "Pet Friendly"
    #& is a safe operator - if elements exist, find the first part. If this exists, find the text
    product_details[:pet_friendly] = true
  end

  product_details[:name] = doc.search('.product-single__title').text

  if doc.search('.custom-pdp-description').text.present?
    product_details[:description] = doc.search('.custom-pdp-description').text.gsub("\n","")
  else
    product_details[:description] = "Easy going and shade tolerant, the perfect addition for those looking to add a splash of colour to their home interior."
  end

  product_details[:space] = space

  if doc.search('.custom-pdp-description-icon-sun').text.present?
    product_details[:light] = doc.search('.custom-pdp-description-icon-sun').text
  else
    product_details[:light] = "Bright, indirect light"
  end

  product_details[:plant_type] = ["Fern", "Flowering", "Fruit", "Vegetable", "Succulent"].sample

  if doc.search(' .custom-pdp-description-icon-water').text.present?
    product_details[:watering] = doc.search(' .custom-pdp-description-icon-water').text
  else
    product_details[:watering] = "Water weekly"
  end

  product_details
end

product_url_list = scraper_index()
  product_url_list.each do |url|
    product_details = scrape_product(url)
    plant = Plant.new(product_details)
     #  html = open(url).read
     #  doc = Nokogiri::HTML(html)
     # p plant_photo = doc.search('.product-featured-img').attribute("src").value
     #  file = URI.open(plant_photo)
     #  plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')
      html = open(url).read
      doc = Nokogiri::HTML(html)
     p plant_photo = doc.search('.product-featured-img').attribute("src").value
      # p 'https:'+plant_photo
      file = URI.open('https:'+plant_photo)
      plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')
    plant.save!
    puts "Created Indoor Plant #{plant.id} has been created"
  end

product_url_list = scraper_index("https://www.leafenvy.co.uk/collections/all?page=2")
  product_url_list.each do |url|
    product_details = scrape_product(url,"Outdoors")
    plant = Plant.new(product_details)

     html = open(url).read
      doc = Nokogiri::HTML(html)
     p plant_photo = doc.search('.product-featured-img').attribute("src").value
      # p 'https:'+plant_photo
      file = URI.open('https:'+plant_photo)
      plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

    plant.save!
    puts "Created Outdoor Plant #{plant.id} has been created"
  end

puts "Finished!"
