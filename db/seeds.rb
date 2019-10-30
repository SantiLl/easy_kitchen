puts 'Cleaning database...'
puts 'Erasing reviews...'
Review.destroy_all
puts 'Erasing appointments...'
Appointment.destroy_all
puts 'Erasing kitchens...'
Kitchen.destroy_all
puts 'Erasing users...'
User.destroy_all
require 'faker'
puts 'Creating admin user...'

admin = User.create!(email: 'admin@easy-kitchen.com', password: 'kitchen', remote_photo_url: 'https://raymanpc.com/wiki/images/1/15/Admin.png')
puts 'Creating regular users...'
alejo = User.create!(email: 'alejo@easy-kitchen.com', password: 'kitchen', remote_photo_url: 'https://ca.slack-edge.com/T02NE0241-UNDMY14Q5-3615c3435408-512')
santiago = User.create!(email: 'santiago@easy-kitchen.com', password: 'kitchen', remote_photo_url: 'https://ca.slack-edge.com/T02NE0241-UNDKPE0D6-3ae91634e71a-72')
enzo = User.create!(email: 'enzo@easy-kitchen.com', password: 'kitchen', remote_photo_url:'https://ca.slack-edge.com/T02NE0241-UNDJE9Y1J-2cd2134f004a-72')
andres = User.create!(email: 'andres@easy-kitchen.com', password: 'kitchen', remote_photo_url:'https://ca.slack-edge.com/T02NE0241-UNDCB0BTN-6e9c411fc926-512')
puts 'Creating kitchens...'
kitchen1 = Kitchen.create!(user_id: alejo.id, address: Faker::Address.street_address, description: Faker::Restaurant.description, name:'El buen sabor', remote_photo_url:"https://images.unsplash.com/photo-1541604193435-22287d32c2c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", price:'1360 ', latitude:'-34.583391', longitude:'-58.435571')
kitchen2 = Kitchen.create!(user_id: santiago.id, address: Faker::Address.street_address, description: Faker::Restaurant.description, name: 'Al buen fuego', remote_photo_url:"https://images.unsplash.com/photo-1556912167-f556f1f39fdf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1360&q=80", price:'4533 ', latitude:'-34.575574', longitude:'-58.443730')
kitchen3 = Kitchen.create!(user_id: enzo.id, address: Faker::Address.street_address, description: Faker::Restaurant.description, name: 'Delixous', remote_photo_url:"https://images.unsplash.com/photo-1565183928294-7063f23ce0f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80", price:'1938', latitude:'-34.577694', longitude:'-58.470662')
kitchen4 = Kitchen.create!(user_id: andres.id, address: Faker::Address.street_address, description: Faker::Restaurant.description, name:'Alta comida', remote_photo_url:"https://images.unsplash.com/photo-1512916194211-3f2b7f5f7de3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", price:'1340', latitude:'-34.572778', longitude:'-58.480191')
puts 'Creating appointments...'
agc = Appointment.create!(user_id: alejo.id, kitchen_id: kitchen1.id, date: '2019-08-29')
sy = Appointment.create!(user_id: santiago.id, kitchen_id: kitchen2.id, date: '2019-09-23')
em = Appointment.create!(user_id: enzo.id, kitchen_id: kitchen3.id, date: '2019-10-12')
ac = Appointment.create!(user_id: andres.id, kitchen_id: kitchen4.id, date:'2019-10-29')
puts 'Creating reviews...'
3.times do
review =Review.create!(content: Faker::Restaurant.review   , appointment_id: agc.id, rating: 4)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , appointment_id: sy.id, rating: 3)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , appointment_id: em.id, rating: 4)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , appointment_id: ac.id, rating: 5)
end
