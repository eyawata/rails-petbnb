require 'faker'


puts "Destroying all existing data"

Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Cleaned database!"

pet_names = [
  "Bella", "Charlie", "Max", "Luna", "Rocky", 
  "Daisy", "Milo", "Coco", "Ruby", "Oliver"
]

species = [
  "Dog", "Cat", "Bird", "Rabbit", "Hamster", 
  "Turtle", "Fish", "Snake", "Guinea Pig", "Lizard"
]

descriptions = [
  "Loves to cuddle and play fetch.",
  "Quiet and independent, enjoys sunny naps.",
  "Sings beautifully in the mornings.",
  "Soft and gentle, perfect for families.",
  "Active and playful, loves running in a wheel.",
  "Relaxed and low-maintenance, loves to bask.",
  "A colorful companion, mesmerizing to watch.",
  "Unique and fascinating, enjoys exploring.",
  "Small and sweet, loves fresh vegetables.",
  "Adventurous and friendly, loves climbing.",
  "Energetic and loyal, loves long walks.",
  "Shy but affectionate once they trust you.",
  "A curious explorer who enjoys discovering new things.",
  "Loves being the center of attention and making people smile.",
  "Quiet and calming, perfect for peaceful evenings.",
  "Playful and mischievous, always up to something fun.",
  "Affectionate and loves belly rubs.",
  "Graceful and elegant, a true showstopper.",
  "Friendly and social, loves meeting new people.",
  "A gentle companion, great with kids."
]


puts "Creating users..."


10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123123' # needs to be at least 6 characters
  )
end

puts "Created #{User.count} pets!"
puts "Creating pets..."

pet_names.each do |name|
  Pet.create!(
    name: name,
    species: species.sample,
    description: descriptions.sample,
    price: rand(50..200),
    user: User.all.sample
  )
end

puts "Created #{Pet.count} pets!"