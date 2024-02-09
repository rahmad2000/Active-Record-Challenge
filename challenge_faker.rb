require_relative 'ar.rb'

10.times do
    category = Category.create(name: Faker::Commerce.department)
    10.times do
      category.products.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence,
        price: Faker::Commerce.price,
        stock_quantity: Faker::Number.between(from: 1, to: 100)
      )
    end
  end
  