class Product < ApplicationRecord
    belongs_to :shop
    has_many :categories , through: :product_category
    has_many :product_categories    
end
