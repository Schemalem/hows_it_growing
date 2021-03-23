require 'nokogiri'
require 'open-uri'
# require 'pry'

# puts "Cleaning database..."
# Plant.destroy_all
# User.destroy_all

# puts "Creating Plants..."
# 10.times do
#   user = User.create(
#     email: Faker::Internet.email,
#     password: "hello12345",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     user_name: Faker::Hipster.words
#   )
#   puts "Created #{user.email}"
# end

# def scraper_index(plant_url = 'https://www.leafenvy.co.uk/collections/all')
#   html = open(plant_url).read
#   doc = Nokogiri::HTML(html)
#   base_url = "https://www.leafenvy.co.uk"

#   url_list = doc.search('.product-card a').map do |card|
#     base_url + card["href"]
#   end

#   url_list
# end

# def scrape_product(plant_url, space = "Indoors")
#   html = open(plant_url).read
#   doc = Nokogiri::HTML(html)

#   product_details = {}
#   elements = doc.search('li.custom-pdp-description-icon-tip')
#   if elements&.first&.text == "Pet Friendly"
#     #& is a safe operator - if elements exist, find the first part. If this exists, find the text
#     product_details[:pet_friendly] = true
#   end

#   product_details[:name] = doc.search('.product-single__title').text

#   if doc.search('.custom-pdp-description').text.present?
#     product_details[:description] = doc.search('.custom-pdp-description').text.gsub("\n","")
#   else
#     product_details[:description] = "Easy going and shade tolerant, the perfect addition for those looking to add a splash of colour to their home interior."
#   end

#   product_details[:space] = space

#   # if doc.search('.custom-pdp-description-icon-sun').text.present?
#   #   product_details[:light] = doc.search('.custom-pdp-description-icon-sun').text
#   # else
#   #   product_details[:light] = "Bright, indirect light"
#   # end

#   product_details[:light] = ["no light", "low light", "indirect light", "medium light", "bright light"].sample

#   product_details[:plant_type] = ["Fern", "Flowering", "Fruit", "Vegetable", "Succulent"].sample

#   if doc.search(' .custom-pdp-description-icon-water').text.present?
#     product_details[:watering] = doc.search(' .custom-pdp-description-icon-water').text
#   else
#     product_details[:watering] = "Water weekly"
#   end

#   product_details
# end

# product_url_list = scraper_index()
#   product_url_list.each do |url|
#     product_details = scrape_product(url)
#     plant = Plant.new(product_details)
#      #  html = open(url).read
#      #  doc = Nokogiri::HTML(html)
#      # p plant_photo = doc.search('.product-featured-img').attribute("src").value
#      #  file = URI.open(plant_photo)
#      #  plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')
#       html = open(url).read
#       doc = Nokogiri::HTML(html)
#      p plant_photo = doc.search('.product-featured-img').attribute("src").value
#       # p 'https:'+plant_photo
#       file = URI.open('https:'+plant_photo)
#       plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')
#     plant.save!
#     puts "Created Indoor Plant #{plant.id} has been created"
#   end

# product_url_list = scraper_index("https://www.leafenvy.co.uk/collections/all?page=2")
#   product_url_list.each do |url|
#     product_details = scrape_product(url,"Outdoors")
#     plant = Plant.new(product_details)

#      html = open(url).read
#       doc = Nokogiri::HTML(html)
#      p plant_photo = doc.search('.product-featured-img').attribute("src").value
#       # p 'https:'+plant_photo
#       file = URI.open('https:'+plant_photo)
#       plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

#     plant.save!
#     puts "Created Outdoor Plant #{plant.id} has been created"
#   end

# product_url_list = scraper_index("https://www.leafenvy.co.uk/collections/all?page=3")
#   product_url_list.each do |url|
#     product_details = scrape_product(url,"Indoors")
#     plant = Plant.new(product_details)

#      html = open(url).read
#       doc = Nokogiri::HTML(html)
#      p plant_photo = doc.search('.product-featured-img').attribute("src").value
#       # p 'https:'+plant_photo
#       file = URI.open('https:'+plant_photo)
#       plant.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

#     plant.save!
#     puts "Created Indoor Plant #{plant.id} has been created"
#   end

# puts "Finished!"

puts "Creating new plants"
  agave = Plant.new(name: "Artichoke Agave", description: "This artichoke-shaped agave has beautiful blue-gray leaves with sharp spines running along the ridges. Each leaf is tipped with a long dark spike. Although it is a slow-grower, it can grow up to four feet wide. Watch for yellow flowers in mature specimens in the summer. It is monocarpic, but will produce offsets that continue growing after the mother plant has died.", space: "Outdoors", light: "indirect light", plant_type: "Succulent", watering: "water every 2 weeks, they don’t need watering often!", pet_friendly: false)

  file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616526970/Screenshot_2021-03-23_at_18.09.36_lmxtij.png')
  agave.photo.attach(io: file, filename: 'agave.png', content_type: 'image/png')

  agave.save!
   puts "Created agave"


   perle = Plant.new(name: "Echeveria Perle Von Nurnberg", description: "‘Perle von Nurnberg’ is a beautiful evergreen gray succulent that turns pink and purple under full sun. It has pink flowers with yellow interiors that bloom in the summer. If there are dead leaves on PVN, it is best to remove them quickly, as they can attract pests. It is one of the most prolific succulents, making it very easy to propagate. It does well in succulent wedding bouquets.", space: "Outdoors", light: "bright light", plant_type: "Succulent", watering: "water every 2 weeks, they don’t need watering often!", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/dtrymfluw/image/upload/v1616527415/perle_sdw2dq.jpg')
  perle.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  perle.save!


  bear = Plant.new(name: "Bear Paw", description: "It’s easy to see where this shrubby succulent gets its name! The thick, fuzzy leaves have 3 to 10 'teeth' at the end, similar to the paws of a bear. When 'happily stressed,'' the leaf tips turn a deep red.", space: "Indoors", light: "medium light", plant_type: "Succulent", watering: "water every 2 weeks, they don’t need watering often!", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/dtrymfluw/image/upload/v1616527406/Screenshot_2021-03-23_at_18.09.22_omj9n3.png')
  bear.photo.attach(io: file, filename: 'plant.png', content_type: 'image/png')

  bear.save!


  baby = Plant.new(name: "Baby Toes", description: "This 'window-leaf' succulent grows tubes instead of rosettes, with only the tips of its leaves growing above ground in the wild. It has white or yellowy flowers that bloom in the Spring or Fall. 'Baby Toes' is a favorite for indoor succulent gardens.", space: "Indoors", light: "low light", plant_type: "Succulent", watering: "water every 2 weeks, they don’t need watering often!", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/dtrymfluw/image/upload/v1616527406/Screenshot_2021-03-23_at_18.09.13_po6wx1.png')
  baby.photo.attach(io: file, filename: 'plant.png', content_type: 'image/png')

  baby.save!


  gardenia = Plant.new(name: "Gardenia", description: "Known for its rich scent, this waxy flower with glossy thick leaves is often used in perfumes. An evergreen shrub that can grow 8 feet tall, gardenias grow best in humid areas.", space: "Outdoors", light: "bright light", plant_type: "Flowering", watering: "water every 2 weeks, they don’t need watering often!", pet_friendly: false)

  file = URI.open('https://res.cloudinary.com/dcvr86xuh/image/upload/v1616528506/gardenia2_yufetq.jpg')
  gardenia.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  gardenia.save!


  carrot = Plant.new(name: "carrot", description: "Delicious and packed with vitamins, carrots are a traditional grow-your-own favourite. As well as the classic long orange roots, look out for small round carrots and even red, yellow or purple varieties. Carrots are quick and easy to grow, taking up little space, and can even be grown in containers. Sow small batches regularly for cropping from early summer through to autumn.", space: "Outdoors", light: "medium light", plant_type: "Vegetable", watering: "water every 2 weeks, they don't need watering often!", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616527294/carrot_1_j1vvi6.jpg')
  carrot.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  carrot.save!


  rhubarb = Plant.new(name: "rhubarb", description: "Rhubarb is easy to grow, producing masses of delicious stalks every year. Despite being a vegetable, rhubarb is considered to be one of the earliest fruits of the year. Only the rhubarb stalks are edible; be sure to compost the poisonous leaves. Rhubarb can be used in a variety of ways but is usually stewed with a little sugar and used in crumbles and as a nutritious topping for porridge. You can also use rhubarb to make cordials and other drinks.", space: "Outdoors", light: "indirect light", plant_type: "Vegetable", watering: "water every 2 weeks, particularly during dry spells", pet_friendly: false)

  file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616527293/rhubarb_ji8hse.jpg')
  rhubarb.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  rhubarb.save!


raspberries = Plant.new(name: "raspberries", description: "Raspberries are popular garden fruits that are easy to grow. Try growing both summer and autumn-fruiting varieties: just a few plants will reward you with plenty of fruit from mid-summer until mid-autumn. If you end up with a glut, raspberries also freeze well, and make wonderful jams, sauces and cooked desserts.", space: "Outdoors", light: "bright light", plant_type: "Fruit", watering: "water weekly, pay extra attention during dry spells", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616527294/raspberry_ziqusm.jpg')
  raspberries.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  raspberries.save!


chilli =  Plant.new(name: "chilli", description: "There are thousands of chilli varieties to grow, in a huge range of colours, shapes, sizes and levels of heat, from mild to extremely hot. They’re very easy to grow from seed, and grow best in containers, which means they are perfect for a sunny patio or balcony. Sow indoors in March and move them outside when all risk of frost has passed. Chillies are tender plants, so will not survive the winter or cold temperatures.", space: "Outdoors", light: "bright light", plant_type: "Fruit", watering: "water weekly - little and often", pet_friendly: false)

file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616527416/chilli2019redfrontg_a64q4n.jpg')
  chilli.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  chilli.save!


strawberry = Plant.new(name: "strawberry", description: "Strawberries are an easy and fun crop to grow. The strawberry is a succulent and fragrant fruit of bright red colour, obtained from the plant with the same name. Plant in mid-spring to late summer into moist soil and a sheltered, sunny position.", space: "Outdoors", light: "indirect light", plant_type: "Fruit", watering: "water weekly - avoid getting the fruit wet", pet_friendly: true)

  file = URI.open('https://res.cloudinary.com/sch3mal3m/image/upload/v1616528203/strawb_1_ujm342.jpg')
  strawberry.photo.attach(io: file, filename: 'plant.jpg', content_type: 'image/jpg')

  strawberry.save!
  puts "Created strawberry"
