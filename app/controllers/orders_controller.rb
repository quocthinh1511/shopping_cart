class OrdersController < ApplicationController

  def index 
    @orders = Order.all 
  end
  def destroy 

  end
end