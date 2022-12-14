module ShoppersHelper
    def current_shop
        @user = User.find_by(id: session[:user_id])
        if (@user && @user.role == 2)
            @user.shop
        else 
            return nil
        end
    end

    def create_shop?
        !current_shop.nil?
    end
end