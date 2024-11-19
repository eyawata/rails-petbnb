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
  ["Dog", "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Cat", "https://images.pexels.com/photos/1741205/pexels-photo-1741205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Bird", "https://images.pexels.com/photos/17811/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Rabbit", "https://images.pexels.com/photos/326012/pexels-photo-326012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Hamster", "https://images.pexels.com/photos/2013665/pexels-photo-2013665.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Turtle", "https://images.pexels.com/photos/3150271/pexels-photo-3150271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Fish", "https://images.pexels.com/photos/1145274/pexels-photo-1145274.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Snake", "https://images.pexels.com/photos/34426/snake-rainbow-boa-reptile-scale.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Guinea Pig", "https://images.pexels.com/photos/63853/guinea-pig-sea-pig-house-cute-guinea-pig-house-63853.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
  ["Lizard", "https://images.pexels.com/photos/735174/pexels-photo-735174.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"]
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
  arr = species.sample
  photo_url = arr[1]
  breed = arr[0]

  Pet.create!(
    name: name,
    species: breed,
    description: descriptions.sample,
    price: rand(50..200),
    user: User.all.sample
  )
end

puts "Created #{Pet.count} pets!"

puts "Creating bookings..."

10.times do
  pet = Pet.all.sample
  Booking.create!(
    start_date: DateTime.now,
    end_date: DateTime.now + rand(1..4),
    total_price: pet.price,
    pet: pet,
    user: User.where.not(id: pet.user).sample
  )
end

puts "Created #{Booking.count} bookings!"