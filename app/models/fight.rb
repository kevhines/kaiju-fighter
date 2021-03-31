class Fight < ApplicationRecord
    belongs_to :challenger, class_name: "Monster"
    belongs_to :defender, class_name: "Monster"
    belongs_to :location
    validates_presence_of :title, :challenger_id, :defender_id, :location_id
   

    def location_attributes=(arg)
        #binding.pry
        arg[:name] = arg[:name].titlecase
        self.location = Location.find_or_create_by(arg)
    end

    def attack
        if rand(2) == 1
           # binding.pry
            self.winner = self.challenger_id
            loser = self.defender.id
        else
            self.winner = self.defender_id
            loser = self.challenger.id
        end
       # binding.pry
        self.save
        Monster.health_change(winner: self.winner, loser: loser)
    end

    def winner_name
        monster = Monster.find_by_id(self.winner)
        !!monster ? monster.name : "Draw!"
    end




end
