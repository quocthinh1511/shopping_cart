class ProductsController < ApplicationController    
    before_action :set_categories
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    def index
        @products = Product.paginate(page: params[:page]) 
        @order_item = current_order.order_items.new
        @shops = Shop.all
    end

    def index_shop    
        @products = current_shop.products
    end

    def search
        @products = Product.where("name LIKE?", '%' + params[:q]+ '%')
    end

    def show 
        @product = Product.find_by(id: params[:id])
    end

    def showtocart 
        @product = Product.find_by(id: params[:id])
        @order_item = current_order.order_items.new
    end

    def new
        @product = Product.new
    end

    def destroy
        Product.find(params[:id]).destroy
        flash[:success] = "Product deleted"
        redirect_to shoppage_path
    end

    def create
        @product = current_shop.products.build(product_params)
        if @product.save
            flash[:success] = 'Your product has been created'
            redirect_to @product
        else
            flash[:warning] = "Cannot create product!!"
            render 'products/new'
        end
    end

    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            # Handle a successful update.
           redirect_to shoppage_path
        else
            render 'procduct/show'
        end
    end

   # def buy
        #id = params[:id].to_i 
       # @product = Product.find(params[:id])
   # end

    private
        def product_params    
            params.require(:product).permit(:name, :description, :image, :quantity ,:price,:author,:category_id)
        end
        def set_categories 
            @category = Category.all.order(:name)
        end
        def logged_in_user
            unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
            end
        end 
end
