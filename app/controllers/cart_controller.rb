class CartController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def show
    @order = current_order
    @order_items = @order.order_items
  end
  private 
  def logged_in_user
    unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end 
end
