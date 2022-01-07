# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  Item.create({
    name: Faker::Commerce.unique.product_name,
    quantity: rand(1..1000),
    upc: Faker::Barcode.upc_a,
    description: "A test description.",
    price: Faker::Number.number(digits: 4),
    weight: Faker::Number.number(digits: 6),
  })
end 
