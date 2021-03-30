class ApplicationController < ActionController::Base
    helper_method(:my_monster?, :current_user) 
   
    def current_user
        User.find_by(id: session[:user_id])
    end

    def my_monster?(monster)
        monster.user_id == current_user.id
    end
end
