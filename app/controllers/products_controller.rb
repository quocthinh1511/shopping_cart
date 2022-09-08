class ProductsController < ApplicationController    
    before_action :set_categories
    def index
        @products = Product.paginate(page: params[:page]) 
    end
    def search
        @products = Product.where("name LIKE?", '%' + params[:q]+ '%')
    end
    def show 
        @product = Product.find_by(id: params[:id])
    end

    def new
        @product = Product.new
    end
    def destroy
        Product.find(params[:id]).destroy
        flash[:success] = "Product deleted"
        redirect_to products_url
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
        
    end

    def update
      #  @shop = Shop.find_by(id: params[:id])
     #   if @shop.update(shop_params)
            # Handle a successful update.
         #   redirect_to @shop
       # else
          #  render 'procduct/show'
        #end
    end
    private
        def product_params    
            params.require(:product).permit(:name, :description, :image, :quantity ,:price,:author,:category_id)
        end
        def set_categories 
            @category = Category.all.order(:name)
        end
end
