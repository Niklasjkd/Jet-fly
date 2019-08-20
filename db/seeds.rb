# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning databases...'
User.destroy_all
Plane.destroy_all
Booking.destroy_all
Review.destroy_all

require 'faker'

puts 'Creating 100 fake restaurants...'

10.times do
  user = User.new(
    email: "#{Faker::Internet.free_email}",
    full_name: "#{Faker::Name.name}",
    password: "#{Faker::Invoice.creditor_reference}"
  )
  user.save!
end

imageArr = ["private-jet1_quqsy5",
"Private-Jet-Charter-Priority-One-Jets-e1464293444844_wyxjiq",
"Challenger-604_sx9fsu"]

15.times do
  plane = Plane.new(
    price_per_min: rand(500..5000),
    base_price: rand(500..5000),
    location:  "#{Faker::Address.city}",
    description:  "#{Faker::Vehicle.color}",
    user_id: rand(1..10),
    image: imageArr[rand(0..imageArr.size)]
  )
  plane.save!
end

20.times do
  booking = Booking.new(
    user_id: rand(1..10),
    plane_id: rand(1..15),
    destination: "#{Faker::Address.city}",
    start_date: Faker::Date.forward(days: rand(2..30)),
    end_date: Faker::Date.forward(days: rand(30..50))
  )
  booking.save!
end

30.times do
  review = Review.new(
    content: "#{Faker::Dessert.flavor}",
    booking_id: rand(1..20)
  )
  review.save!
end

puts 'Finished!'
