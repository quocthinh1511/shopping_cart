class Product < ApplicationRecord
    belongs_to :shop
    has_many :order_items
    validates :category_id, presence:true
    mount_uploader :image, ImageUploader
end
