module ProductsHelper
    def current_product
        @product = Product.find_by(id: shop[:shop_id])
        if (@user && @user.role == 2)
            @user.shop
        else 
            return nil
        end
    end
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
            log_in user
            @current_user = user
        end
        end
    end
    def current_category 
        @current_category = Category.find(params[:id])
    end
end