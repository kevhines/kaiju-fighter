class FightsController < ApplicationController

    before_action :require_login
    before_action :set_monster, only: [:new, :create]
    before_action :get_monsters, only: [:new, :create]

    def index
        @fights = Fight.all
    end

    def new
        @fight.location = Location.new
    end

    def create
        if @fight.save
            @fight.attack
            redirect_to monster_path(@monster)
        else
            @errors = @fight.errors.full_messages
            render :new
        end
    end

    def battle
    end

    def createbattle
       title = params[:fight][:title]
       Fight.battle_royale(title)
       @fights = Fight.last(Monster.all.count / 2)
       render :battle
    end

    private

    def fight_params
        params.require(:fight).permit(:title, :defender_id, :challenger_id, location_attributes: [:name])
    end

    def set_monster
        @monster = Monster.find_by(id: params[:monster_id])
    end

    def get_monsters
        if my_monster?(@monster) 
            @fight = build_fight("fights_challenged")
            @monsters = Monster.others(@monster.id)
        else
            @fight = build_fight("fights_defended")
            @monsters = current_user.monsters
        end
    end

    def build_fight(arg)
        if params[:action] == "new"
            @monster.send(arg).build
        else
            @monster.send(arg).build(fight_params)
        end
    end

end
