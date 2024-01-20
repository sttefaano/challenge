15.times do
  Product.create(
    name: Faker::Commerce.product_name
  )
end

User.create(username: "stefano", password: "123ABc")

puts 'products created successfully'
