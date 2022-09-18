class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :set_sum
  def sum
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum
  end
  private

  def set_sum
      self[:sum] = sum
  end
end