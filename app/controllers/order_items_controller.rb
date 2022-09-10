class OrderItemsController < ApplicationController  

  #before_action :logged_in_user, only: [:create, :destroy]
  def new 
    
  end
    def create
        @order = current_order
        @order_item = @order.order_items.build(order_item_params)
        if @order.save
          flash[:info] = "This items added. Check your cart!"
        end
        session[:order_id] = @order.id
      end
    
      def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_item_params)
        @order_items = @order.order_items
      end
    
      def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = @order.order_items
      end
    private
      def order_item_params
        params.require(:order_item).permit(:quantity,:price,:total, :product_id)
      end
end