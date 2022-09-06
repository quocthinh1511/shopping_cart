class Shop < ApplicationRecord
    has_many :products 
    has_many :categories
    belongs_to :user
end
