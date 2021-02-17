puts 'Cleaning database'
Restaurant.destroy_all
puts 'DB Clean!'

puts 'Creating 100 restaurants...'
100.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    stars: rand(1..3),
    chef_name: ['Disco-Chef', 'Marco-Pierre White', 'Heston Blumenthaal', 'Nigella Lawson', 'Gordon Ramsey', 'Alain Ducasse'].sample
  )
  puts "restaurant #{restaurant.id} added..."
end
puts 'Restaurants created!'
