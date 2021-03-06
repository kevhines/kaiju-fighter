class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_monsters_path(@user.id)
        elsif @user
          @errors = ["Invalid Password"]
          render :new
        else
          @errors = ["Invalid Username"]
          render :new
        end
    end  

  def createfb
    user = User.find_or_create_by(username: fb_auth['info']['email']) do |u|
      u.password = 'temp_password'
    end

    if user.save
      session[:user_id] = user.id
      redirect_to user_monsters_path(user.id)
    else
      redirect_to signup_path
    end
  end

  def destroy
      session.clear
      redirect_to '/login'
  end

  private

  def fb_auth
    self.request.env['omniauth.auth']
  end

end
  