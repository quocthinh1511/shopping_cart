class Product < ApplicationRecord
    has_many :categories , through: :product_category
    has_many :product_categories   
end
