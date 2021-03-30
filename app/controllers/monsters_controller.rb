class MonstersController < ApplicationController

    def index
        @monsters = Monster.all
    end

    def new
        @monster = Monster.new
    end

    def show
        @monster = Monster.find_by(id: params[:id])
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
        monster = Monster.find_by(id: params[:id])
        if monster.update(monster_params)
            redirect_to user_path(current_user)
        else
            redirect_to edit_monster_path(monster), alert: monster.errors.full_messages
        end
    end

    def edit
        @monster = Monster.find_by(id: params[:id])
    end

    private
   
    def monster_params
        params.require(:monster).permit(:name)
    end

end
