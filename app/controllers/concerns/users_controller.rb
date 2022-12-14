class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: :destroy
    def new
        @user = User.new
    end
    def show
        if logged_in?
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page])
        end 
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
        redirect_to root_url and return unless true
     
    end
    def create
        @user = User.new(user_params) # Not the final implementation!
        if @user.save
            @user.send_activation_email
            flash[:info] = "Please check your email to activate your account."
            redirect_to root_url
        # Handle a successful save.
        else
        render 'new'
        end
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = " User deleted"
        redirect_to users_url
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            # Handle a successful update.
            redirect_to @user
        else
            render 'edit'
        end
    end
   def user 
     return @user
   end
    def index
        @users = User.where(activated: true).paginate(page: params[:page])
    end
  
    private
    def user_params
        params.require(:user).permit(:name, :email, :password,:password_confirmation,:phone,:address,:avatar)
    end
    def logged_in_user
        unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
        end
    end 
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    
  
end