require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

#Inspect the Product Object:
puts "Columns in Product table: #{Product.column_names}"

#Find Products Above $10 Starting with 'C':
products_above_10_starting_with_c = Product.where('price > ? AND name LIKE ?', 10, 'C%')
puts "Products above $10 starting with 'C':"
products_above_10_starting_with_c.each { |product| puts product.name }

#Count Low Stock Products:
low_stock_count = Product.where('stock_quantity < ?', 5).count
puts "Total number of low stock products: #{low_stock_count}"








## Find the Name of the Category Associated with a Product
products = Product.all
products.each do |product|
  puts "ID: #{product.id}, Name: #{product.name}"
end

product_id = 155 
product = Product.find(product_id)

# Get the category name using the "belongs to" association
category_name = product.category.name
puts "Product #{product.name} belongs to the category: #{category_name}"





## Build and Persist a New Product Associated with a Specific Category
categories = Category.all
if categories.any?
  puts "All Categories with IDs and Names:"
  categories.each do |category|
    puts "ID: #{category.id}, Name: #{category.name}"
  end
else
  puts "No categories found in the database."
end

category_id = 1
category = Category.find(category_id)

# Build a new product associated with this category
new_product = category.products.build(name: 'Newer Product', description: 'Product Description', price: 100, stock_quantity: 10)

# Save the new product
new_product.save
puts "New product created under category #{category.name}: #{new_product.inspect}"





##Find Products of a Specific Category Over a Certain Price
category_id = 1 
category = Category.find(category_id)

# Adding the price limit
price_limit = 50 

# Find products in the category over the price limit
products_over_price = category.products.where('price > ?', price_limit)

puts "Products in category #{category.name} over price $#{price_limit}:"
products_over_price.each do |product|
  puts "#{product.name} - $#{product.price}"
end



