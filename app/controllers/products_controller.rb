class ProductsController < ApplicationController    
    def index
        
    end

    def show 
        @product = Pruduct.find_by(id: params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @shop = Shop.find_by(id: session[:user_id])

        @product.user_id = shop[:id]
        
        if @product.save
            
            flash[:success] = 'Your product has been created'
            redirect_to root_path 
        else
            flash[:warning] = "Cannot create product!!"
            render 'pruduct/new'
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
        def product_params
            params.require(:shop).permit(:name, :description, :image, :quantity ,:price,:author)
        end
end
