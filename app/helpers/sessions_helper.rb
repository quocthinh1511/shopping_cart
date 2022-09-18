module SessionsHelper
  
    def log_in(user)
        session[:user_id] = user.id
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

    def current_shop
        @user = User.find_by(id: session[:user_id])
        @user.shop
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def current_user?(user)
        user && user == current_user
    end

    def getId(product)
        $current_product_id = @product.id
    end
    def getId(shop)
        $current_shop_id = @shop.id
    end


    def current_product
        @current_product = Product.find($current_product_id);
    end
 
    def current_category 
        @current_category = Category.find(params[:id])
    end
    def current_order
        if !session[:order_id].nil?
            Order.find(session[:order_id])
        else
            Order.new
        end
    end
    
    
    

end
