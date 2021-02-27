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
100.times do
  suit = Suit.create(
    user_id: User.all.sample.id,
    description: Faker::Superhero.name,
    space: rand(32..50),
    light: Faker::Color.color_name,
    plant_type: ["Formal", "Posh", "Hipster", "Informal"].sample,
    watering:["Interview", "Funeral", "Wedding", "Party", "Date"].sample,
    )

puts "Created Plant #{plant.id} has been created"
end
puts "Finished!"