class Product < ApplicationRecord
    belongs_to :shop
    has_many :categories , through: :product_category
    has_many :product_categories  
    validates :category_id, presence:true
    mount_uploader :image, ImageUploader
end
