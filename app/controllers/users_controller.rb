class UsersController < ApplicationController

  before_action :require_login, only: [:index]

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_monsters_path(@user.id)
        else
          @errors = @user.errors.full_messages
          render :new
        end
    end

      def index
        @users = User.all
      end


    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
