# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning databases...'
Review.destroy_all
Booking.destroy_all
Plane.destroy_all
User.destroy_all

require 'faker'

puts 'Creating 10 fake Users...'

10.times do
  user = User.new(
    email: "#{Faker::Internet.free_email}",
    full_name: "#{Faker::Name.name}",
    password: "123456"
  )
  user.save!
end

puts 'Creating 15 fake Planes...'

GERMANY_CITIES = ['berlin', 'hamburg', 'frankfurt']
GERMANY_COORDINATES = [{ lat: 53.47472016849071, long: 10.057256187500002 }, { lat: 51.24790041004096, long: 8.563115562500002 }, { lat: 48.09247679053504, long: 11.507451500000002 }, { lat: 52.41556658882377, long: 13.397099937500002 }]
PLANE_IMAGES = ["private-jet1_quqsy5", "Private-Jet-Charter-Priority-One-Jets-e1464293444844_wyxjiq", "Challenger-604_sx9fsu"]

15.times do
  current_coordinates = GERMANY_COORDINATES.sample

  plane = Plane.new(
    price_per_min: rand(500..5000),
    base_price: rand(500..5000),
    location:  GERMANY_CITIES.sample,
    description:  "#{Faker::Vehicle.color}",
    user_id: User.all.sample.id,
    image: PLANE_IMAGES.sample,
    lat: current_coordinates[:lat],
    long: current_coordinates[:long]
  )
  plane.save!
end

puts 'Creating 20 fake Booking...'

20.times do
  booking = Booking.new(
    user_id: User.all.sample.id,
    plane_id: Plane.all.sample.id,
    destination: "#{Faker::Address.city}",
    start_date: Faker::Date.forward(days: rand(2..30)),
    end_date: Faker::Date.forward(days: rand(30..50))
  )
  booking.save!
end

puts 'Creating 30 fake Review...'

30.times do
  review = Review.new(
    content: "#{Faker::Dessert.flavor}",
    booking_id: Booking.all.sample.id
  )
  review.save!
end

puts 'Finished!'
