class UsersController < ApplicationController

  before_action :require_login, only: [:show]

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          #redirect_to user_items_path(@user)
          redirect_to root_path
        else
          @errors = @user.errors.full_messages
          render :new
        end
    end

    def show
        if params[:id].to_i == current_user.id
          @monsters = Monster.where("user_id = ?", current_user.id)
        else
          redirect_to user_path(current_user)
        end
    end


    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
