class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def index 
    @orders = Order.all 
  end
  def destroy 

  end
  def create 
    @order = current_user.orders.build(order_params)
    @cart_session.user_id = session[:user_id]
    if @order.save
        flash[:success] = 'Buy successfully'
        redirect_to root_path
    else
        flash[:warning] = "Try to buy again!!"
        render 'products/index'
    end
  end
  def checkout
    @cart_session = CartSession.new(@order.attributes)
    if  @cart_session.save 
          
        end
       
    end
      @order.destroy
      flash[:success] = "Order successfully"
      redirect_to root_path
    else 
      flash[:danger] = "Order fail"  
    end
  end
  private 
  def order_params    
    params.require(:order).permit(:sum, :user_id, :order_status_id)
  end
  def logged_in_user
    unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end 
  def newAtrs(cart_item,order)
    { 
      order_id: order.id,
      product_id: order_item.product_id,
      quantity: order_item..quantity,
    }
  end
end