class OrderItemsController < ApplicationController  

  before_action :logged_in_user, only: [:create, :destroy]
    def create
      @order = current_order
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
        redirect_to root_path
        flash[:success]= 'Your item added!'
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
        params.require(:order_item).permit(:quantity, :product_id)
      end
end