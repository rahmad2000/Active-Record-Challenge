require_relative 'ar.rb'

Category.all.each do |category|
    puts "Category: #{category.name}"
    category.products.each do |product|
      puts "  Product: #{product.name}, Price: #{product.price}"
    end
  end