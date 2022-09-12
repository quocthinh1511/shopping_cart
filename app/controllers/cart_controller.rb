class CartController < ApplicationController
  def show
    @order_items = OrderItem.all
  end
end
