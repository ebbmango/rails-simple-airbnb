# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

RNG = Random.new
AMOUNT = 10

puts "Generating #{AMOUNT} flats..."

AMOUNT.times do
  flat = Flat.new(
    name: "#{%w[apartment flat studio].sample.capitalize} at #{Faker::Address.city}",
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    price_per_night: (RNG.rand(3.0) * 100).to_i,
    number_of_guests: rand(1..5)
  )
  flat.save!

  puts "#{flat.name} with id #{flat.id} successfully generated"
end

puts 'Done!'
