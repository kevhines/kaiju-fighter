class MonstersController < ApplicationController

    before_action(:set_monster, only: [:edit, :update, :show])
    before_action :require_login

    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @monsters = user.monsters
        else
            @monsters = Monster.all
        end
    end

    def new
        @monster = Monster.new
    end

    def show
    end


    def create
        monster = Monster.new(monster_params)
        monster.user = current_user
        if monster.save
            redirect_to user_path(current_user)
        else
            redirect_to new_monster_path, alert: monster.errors.full_messages
        end
    end

    def update

        if monster.update(monster_params)
            redirect_to user_path(current_user)
        else
            redirect_to edit_monster_path(monster), alert: monster.errors.full_messages
        end
    end

    def edit
    end

    def standings
        @monsters = Monster.monster_ranked
    end

    def strongest
        @monsters = Monster.strongest.strong_to_weak
    end

    private
   
    def monster_params
        params.require(:monster).permit(:name, :size)
    end

    def set_monster
        @monster = Monster.find_by(id: params[:id])
     end
end
