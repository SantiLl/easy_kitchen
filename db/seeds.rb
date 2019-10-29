puts 'Cleaning database...'
puts 'Erasing users...'
User.destroy_all
puts 'Erasing kitchens...'
Kitchen.destroy_all
puts 'Erasing appointments...'
Appointment.destroy_all
puts 'Erasing reviews...'
Review.destroy_all
require 'faker'
puts 'Creating admin user...'
admin = User.create!(email: 'admin@easy-kitchen.com', password: 'kitchen')
puts 'Creating regular users...'
alejo = User.create!(email: 'alejo@easy-kitchen.com', password: 'kitchen')
santiago = User.create!(email: 'santiago@easy-kitchen.com', password: 'kitchen')
enzo = User.create!(email: 'enzo@easy-kitchen.com', password: 'kitchen')
andres = User.create!(email: 'andres@easy-kitchen.com', password: 'kitchen')
puts 'Creating kitchens...'
kitchen1 = Kitchen.create!(user_id: alejo.id, address: Faker::Address.street_address, description: Faker::Restaurant.description )
kitchen2 = Kitchen.create!(user_id: santiago.id, address: Faker::Address.street_address, description: Faker::Restaurant.description )
kitchen3 = Kitchen.create!(user_id: enzo.id, address: Faker::Address.street_address, description: Faker::Restaurant.description )
kitchen4 = Kitchen.create!(user_id: andres.id, address: Faker::Address.street_address, description: Faker::Restaurant.description )
puts 'Creating appointments...'
Appointment.create!(user_id: alejo.id, kitchen_id: kitchen1.id, date: '2019-08-29')
Appointment.create!(user_id: santiago.id, kitchen_id: kitchen2.id, date: '2019-09-23')
Appointment.create!(user_id: enzo.id, kitchen_id: kitchen3.id, date: '2019-10-12')
Appointment.create!(user_id: andres.id, kitchen_id: kitchen4.id, date:'2019-10-29')
puts 'Creating reviews...'
3.times do
review =Review.create!(content: Faker::Restaurant.review   , kitchen_id: kitchen1.id)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , kitchen_id: kitchen2.id)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , kitchen_id: kitchen3.id)
end
3.times do
review =Review.create!(content: Faker::Restaurant.review   , kitchen_id: kitchen4.id)
end
