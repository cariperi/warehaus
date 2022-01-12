tags = (1..5).map do |i|
  Tag.create({ text: Faker::Commerce.unique.color })
end

10.times do |i|
  Item.create({
    name: Faker::Commerce.unique.product_name,
    quantity: rand(1..1000),
    upc: Faker::Barcode.upc_a,
    description: "A test description.",
    price: Faker::Number.number(digits: 4),
    weight: Faker::Number.number(digits: 6),
    tags: tags.sample(Random.rand(1..3))
  })
end 
