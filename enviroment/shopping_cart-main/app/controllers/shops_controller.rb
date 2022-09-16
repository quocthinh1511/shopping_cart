class ShopsController < ApplicationController    

    def show 
        @shop = Shop.find_by(id: params[:id])
       # @product= Product.find(params[:id])
    end

    def new
        @shop = Shop.new
    end 
    def index
      @shops = Shop.all
    end

    def create
        @shop = Shop.new(shop_params) 
        @user = User.find_by(id: session[:user_id])
        @shop.user_id = session[:user_id]
        if @shop.save
            @user.update_attribute(:role, 2)

            flash[:success] = 'Create shop successfully!'
            redirect_to root_path 
        else
            flash[:warning] = "Cannot create shop!!"
            render 'shops/new'
        end
    end

    def edit
        @shop = Shop.find_by(id: params[:id]) 
    end

    def update
        @shop = Shop.find_by(id: params[:id])
        if @shop.update(shop_params)
            # Handle a successful update.
            redirect_to @shop
        else
            render 'edit'
        end
    end
    
    def destroy
        
    end
   
    private
        def shop_params
            params.require(:shop).permit(:name, :description, :avatar, :phone ,:tax_code, :avatar)
        end
end
