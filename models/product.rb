class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # Associations
  belongs_to :category

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4 }
  validates :description, :price, :stock_quantity, presence: true

end

