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
  user.password = 123456789
  user.admin = false
  user.save
  kitty = Kitty.new(
    first_name: Faker::Creature::Cat.name,
    last_name: Faker::Creature::Cat.name,
    address: Faker::Address.street_address,
  )
  prices = [1,2,3,4,5,6,7,8]
  kitty.public_key = "sadlfgjd;fzgadjgjkls;fgjk"
  kitty.price = prices.sample
  kitty.owner = user
  # kitty.attributes = {}
  # kitty.address = '16 Villa Gaudelet, Paris'
  kitty.save
end



puts 'Seed done for kitty, user and booking'
puts 'Every thing is okay'
