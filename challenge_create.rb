require_relative 'ar.rb'

product1 = Product.new(name: "New Product 1", description: "Description 1", price: 10.0, stock_quantity: 15)
product1.save  # save the product to the database 

product2 = Product.create(name: "New Product 2", description: "Description 2", price: 20.0, stock_quantity: 20)
# automaticallysave the product

begin
  product3 = Product.create!(name: "New Product 3", description: "Description 3", price: 30.0, stock_quantity: 25)
  puts "Product 3 created successfully."
rescue ActiveRecord::RecordInvalid => e
  puts "Error: #{e.message}"
end
# raise an exception if the product fails to save

invalid_product = Product.new(name: "Too Short", price: -5)  # Intentionally invalid
unless invalid_product.save
  puts "Errors encountered: "
  invalid_product.errors.full_messages.each { |message| puts message }
end

puts "Created Product: #{product1.name}, Price: #{product1.price}, Stock: #{product1.stock_quantity}" if product1

puts "Created Product: #{product2.name}, Price: #{product2.price}, Stock: #{product2.stock_quantity}" if product2

if product3
  puts "Created Product: #{product3.name}, Price: #{product3.price}, Stock: #{product3.stock_quantity}"
else
  puts "Product 3 was not created due to validation errors."
end





