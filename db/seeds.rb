# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u = User.create(email:"test@test.com",password:123456, first_name: "George", last_name: "Kastanza")
t = u.trips.create(title: "Andrew Family Vacation", date: "2020-12-05 17:40:31", description: "A really fun getaway")
l = t.locations.create(name: "California", attraction: "Disneyland")
Address.create(street: "disneyland way 123", city: "anaheim", state: "CA", zipcode: 78564,location_id:l.id)

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