class Product < ApplicationRecord
    belongs_to :shop
    has_many :order_items
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :category_id, presence:true
    mount_uploader :image, ImageUploader
end
