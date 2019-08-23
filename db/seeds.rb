puts 'Cleaning db'

puts 'Cleaning booking'
Booking.destroy_all

puts 'Cleaning Kitty'
Kitty.destroy_all

puts 'Cleaning users'
User.destroy_all


# now faking a small database to be able to work on the front end !
require 'faker'

url = ['https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  "https://images.unsplash.com/photo-1489084917528-a57e68a79a1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1488740304459-45c4277e7daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1479623186097-2bb07e242ae0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1466155443295-01c6fe2f72d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1482325732022-f7ef3d08f193?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1478098711619-5ab0b478d6e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1448698314110-8c1b903e0717?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1482848945261-8bbeabb5e3fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1472157592780-9e5265f17f8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1500259571355-332da5cb07aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1470331559656-0d1c11b4ca63?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1496890666403-e6cf521841e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1453367205849-a2f574e19a0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1456677698485-dceeec22c7fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1489183095396-9496d6dc374f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1477349585464-d181ff510abb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1463008420065-8274332e2be8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1417028441456-f283323fe2d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1445499348736-29b6cdfc03b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60"
]
20.times do |i|
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
  user.save!
  kitty = Kitty.new(
    first_name: Faker::Creature::Cat.name,
    last_name: Faker::Creature::Cat.name,

    address: Faker::Address.street_address,

  )
  kitty.remote_photo_url = url[i]
  prices = [1,2,3,4,5,6,7,8]
  kitty.public_key = "sadlfgjd;fzgadjgjkls;fgjk"
  kitty.price = prices.sample
  kitty.owner = user
  # kitty.attributes = {}

  kitty.save!
end

puts 'Seed done for kitty, user and booking'
User.create!(email: 'airtop@gmail.com', password: 'airtop',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, nickname: "Paul")
puts "Added the Airtop user to make thing easier"

puts 'Every thing is very okay'
