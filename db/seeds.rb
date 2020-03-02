# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Review.destroy_all
Booking.destroy_all
Listing.destroy_all
User.destroy_all
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = User.create!(email: 'hello@gmail.com', password: '123123')
b = User.create!(email: 'goodbye@gmail.com', password: '123123')


lista = Listing.create!(user: a,location: '138 kingsland')
listb = Listing.create!(user: b, location: 'bplace')

bookinga = Booking.create!(user: a, listing: listb)
bookingb = Booking.create!(user: b, listing: lista)

reviewa  = Review.create!(rating: 2, reviewer: a, reviewee: b)
reviewb = Review.create!(rating: 5, reviewer: b, reviewee: a)
