# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 0,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

product1 = Product.find_by id: 1
product2 = Product.find_by id: 2
product3 = Product.find_by id: 3
product4 = Product.find_by id: 4
product5 = Product.find_by id: 5

user1 = User.create!({
  first_name:'a',
  last_name: 'a',
  email:'a@a',
  password:'a',
  password_confirmation:'a'
})

user2 = User.create!({
  first_name:'b',
  last_name: 'b',
  email:'b@b',
  password:'b',
  password_confirmation:'b'
})

user3 = User.create!({
  first_name:'c',
  last_name: 'c',
  email:'c@c',
  password:'c',
  password_confirmation:'c'
})

user4 = User.create!({
  first_name:'d',
  last_name: 'd',
  email:'d@d',
  password:'d',
  password_confirmation:'d'
})

user5 = User.create!({
  first_name:'e',
  last_name: 'e',
  email:'e@e',
  password:'e',
  password_confirmation:'e'
})

product1.reviews.create!({
  user_id: user1.id,
  description: 'a',
  rating:'1'
})

product1.reviews.create!({
  user_id: user2.id,
  description: 'b',
  rating:'2'
})

product1.reviews.create!({
  user_id: user3.id,
  description: 'c',
  rating:'3'
})

product1.reviews.create!({
  user_id: user4.id,
  description: 'd',
  rating:'4'
})

product1.reviews.create!({
  user_id: user5.id,
  description: 'e',
  rating:'5'
})

puts "DONE!"
