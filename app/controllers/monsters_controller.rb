class MonstersController < ApplicationController

    def index
        @monsters = Monster.all
    end

    def new
        @monster = current_user.monsters.build
    end

    def show
        @monster = Monster.find_by(id: params[:id])
    end


    def create
        monster = Monster.new(monster_params)
        monster.user = current_user
        monster.save
        redirect_to user_path(current_user)
    end

    def update
        monster = Monster.find_by(id: params[:id])
        monster.update(monster_params)
        redirect_to user_path(current_user)
    end

    def edit
        @monster = Monster.find_by(id: params[:id])
    end

    private
   
    def monster_params
        params.require(:monster).permit(:name)
    end

end
