class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def show
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params) # Not the final implementation!
        if @user.save
            log_in @user
            flash[:success] = "Your account has been created"
            redirect_to @user
        # Handle a successful save.
        else
        render 'new'
        end
    end
    private
    def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end