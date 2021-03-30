class FightsController < ApplicationController

    def new
        monster = Monster.find_by(id: params[:monster_id])
        #binding.pry
        @fight = monster.fights_challenged.build
        @fight.location = Location.new
        @monsters = Monster.where("id != ?", monster.id)
    end

    def create
        monster = Monster.find_by(id: params[:monster_id])
        fight = monster.fights_challenged.build(fight_params)
       #fight = Fight.new(fight_params)
       # binding.pry
        fight.save
        redirect_to monster_path(monster)
    end

    private

    def fight_params
        params.require(:fight).permit(:title, :defender_id, location_attributes: [:name])
    end
end
