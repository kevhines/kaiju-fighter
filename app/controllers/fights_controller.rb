class FightsController < ApplicationController

    before_action :require_login

    def new
        @monster = Monster.find_by(id: params[:monster_id])
        if my_monster?(@monster) 
            @fight = @monster.fights_challenged.build
            @monsters = Monster.where("id != ?", @monster.id)
        else
            @fight = @monster.fights_defended.build
            @monsters = Monster.where("user_id = ?", current_user.id)
        end
        @fight.location = Location.new
    end

    def create
        monster = Monster.find_by(id: params[:monster_id])
        if my_monster?(monster) 
            fight = monster.fights_challenged.build(fight_params)
        else
            fight = monster.fights_defended.build(fight_params)
        end
        if fight.save
            fight.attack
            fight.save
            redirect_to monster_path(monster)
        else
            redirect_to new_monster_fight_path(monster), alert: fight.errors.full_messages
        end
    end

    private

    def fight_params
        params.require(:fight).permit(:title, :defender_id, :challenger_id, location_attributes: [:name])
    end

end
