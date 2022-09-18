class ApplicationController < ActionController::Base   
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    helper_method :current_order
    def hello
        render html: "hello, world!"
    end
 
    include SessionsHelper
   
    #def initialize_session 
       # session[:cart]||= []
   # end
    #def load_cart 
      #  @cart = Product.find(session[:cart])
   # end
    
end
