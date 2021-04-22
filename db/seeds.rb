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
# a = User.create!(first_name: 'Gary', last_name: 'Harry', email: 'hello@gmail.com', password: '123123')
# b = User.create!(first_name: 'Lewis', last_name: 'Louis', email: 'goodbye@gmail.com', password: '123123')

# lista = Listing.create!(user: a, location: 'hamburg', currency: 'gbp', currency_amount: 200, message: 'alleluya', transaction_completed: 'false')
# listb = Listing.create!(user: b, location: 'lyon', currency: 'eur', currency_amount: 666, message: 'bye bye', transaction_completed: 'false')

# bookinga = Booking.create!(user: a, listing: listb)
# bookingb = Booking.create!(user: b, listing: lista)

# reviewa  = Review.create!(rating: 2, reviewer: a, reviewee: b)
# reviewb = Review.create!(rating: 5, reviewer: b, reviewee: a)

puts 'Creating 25 users/listings...'
curr_list = Listing.get_currencies
25.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 123456
    )
    Listing.create!(
        user: user,
        location: Faker::Address.city,
        currency: "#{curr_list.sample}",
        currency_amount: rand(10..20000),
        message: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 4),
        transaction_completed: 'false'
    )
    puts "#{i + 1} - #{user.first_name} => #{user.listings.first.currency}"

  end
  10.times do |i|
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      password: 123456
      )
      Listing.create!(
        user: user,
        location: Faker::Address.city,
        currency: "EUR - Euro",
        currency_amount: rand(10..20000),
        message: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 4),
        transaction_completed: 'false'
        )
        puts "#{i + 26} - #{user.first_name} => #{user.listings.first.currency}"
      end
      puts 'Finished!'
