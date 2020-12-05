# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
trips = []
locations = []


u = User.create(email: "test@test.com", password: 123456, first_name: "Joe", last_name: "Smith")

3.times do
  trips << Trip.create(title: Faker::Ancient.god, date: Faker::Date.between(from: "2021-01-01", to: "2020-12-30"), description: Faker::Quote.famous_last_words, user_id: u.id)
end

10.times do |i|
  locations << Location.create(name: Faker::Movies::LordOfTheRings.location, attraction: Faker::Mountain.range, trip_id: trips.sample.id)
  Address.create(street: Faker::Address.street_name, city: Faker::Address.city_suffix, state: Faker::Address.state, zipcode: Faker::Address.zip_code, location_id: locations[i].id)
end

puts "seeded"

# 3.times do Trip.create(
#     title:
#     date:
#     description:
#     user_id: u.id
# )
# end

# 2.times do 
#   Location.create (
#     name: 
#     attraction:
#   )
# end

# Address.create(
#   street:
#   city:
#   state:
#   zipcode:
# )