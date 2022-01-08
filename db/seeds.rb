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
