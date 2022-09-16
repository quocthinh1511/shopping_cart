class CartController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def show
    @order_items = current_order.order_items
  end
end
