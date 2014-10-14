# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  Category.create({name: Faker::Commerce.department,
                   description: Faker::Hacker.say_something_smart})
end

100.times do
  Product.create({ name: Faker::Commerce.product_name,
                   description: Faker::Company.bs,
                   price: Faker::Commerce.price})
end

200.times do
  product_id = rand(Product.all.count)
  category_id = rand(Category.all.count)
  CategoryPlacement.create ({ product_id: product_id,
                              category_id: category_id })
end