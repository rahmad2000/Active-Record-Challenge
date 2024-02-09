require_relative 'ar.rb'

product_to_delete = Product.find_by(name: 'New Product 3')
product_to_delete.destroy if product_to_delete

