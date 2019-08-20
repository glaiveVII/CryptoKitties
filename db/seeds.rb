puts 'Cleaning db'

puts 'Cleaning Kitty'
Kitty.destroy_all

puts 'Cleaning booking'
Booking.destroy_all

puts 'Cleaning users'

User.destroy_all


# now faking a small database to be able to work on the front end !
require 'faker'


20.times do
  user = User.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
  )
  domain = ["gmail", "hotmail", "yahoo"]
  domain_suffix = [".com", ".co.uk", ".org"]
  user.email = "#{user.first_name}#{user.last_name}@#{domain.sample}#{domain_suffix.sample}"
  user.nickname = "#{user.first_name}#{user.last_name}"
  user.password = 123456
  user.save
  kitty = Kitty.new(
    first_name: Faker::Creature::Cat.name,
    last_name: Faker::Creature::Cat.name,
  )
  prices = [1,2,3,4,5,6,7,8]
  kitty.public_key = "sadlfgjd;fzgadjgjkls;fgjk"
  kitty.price = prices.sample
  kitty.owner = user
  kitty.save
end









# puts 'Creating users...'
# User.create!(name: 'Gaby Martinez', email: 'gaby@gmail.com', password: '123456')
# User.create!(name: 'Izzy Brown', email: 'izzy@gmail.com', password: '123456')
# User.create!(name: 'Lucien George', email: 'lucien@gmail.com', password: '123456')
# User.create!(name: 'Ife Odugbesan', email: 'ife@gmail.com', password: '123456')
# puts 'Users created!'
