class Shop < ApplicationRecord
    has_many :products 
    has_many :categories
    belongs_to :user
    mount_uploader :avatar, ImageUploader
    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
    end
end
