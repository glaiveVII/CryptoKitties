puts 'Cleaning db'

puts 'Cleaning Kitty'
Kitty.destroy_all

puts 'Cleaning booking'
Booking.destroy_all

puts 'Cleaning users'

User.destroy_all


# now faking a small database to be able to work on the front end !
require 'faker'


# puts 'Creating users...'
# User.create!(name: 'Gaby Martinez', email: 'gaby@gmail.com', password: '123456')
# User.create!(name: 'Izzy Brown', email: 'izzy@gmail.com', password: '123456')
# User.create!(name: 'Lucien George', email: 'lucien@gmail.com', password: '123456')
# User.create!(name: 'Ife Odugbesan', email: 'ife@gmail.com', password: '123456')
# puts 'Users created!'
