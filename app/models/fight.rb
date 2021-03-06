class Fight < ApplicationRecord
    
    belongs_to :challenger, class_name: "Monster"
    belongs_to :defender, class_name: "Monster"
    belongs_to :location
    validates_presence_of :title, :challenger_id, :defender_id, :location_id
   

    def location_attributes=(arg)
        arg[:name] = arg[:name].titlecase
        self.location = Location.find_or_create_by(arg)
    end

    def attack
        if rand(99) < (49 + adjust_odds )
            self.winner = self.challenger_id
            loser = self.defender.id
        else
            self.winner = self.defender_id
            loser = self.challenger.id
        end
        self.save
        Monster.health_change(winner: self.winner, loser: loser)
        Location.health_change(battle_site: self.location_id)
    end

    def adjust_odds
        odds_change = (self.challenger.size - self.defender.size)/2
        odds_change += 8  if self.challenger.all_fights.last.winner == self.challenger_id
        odds_change -= 8  if self.defender.all_fights.last.winner == self.defender_id
        odds_change
    end

    def winner_name
        monster = Monster.find_by_id(self.winner)
        !!monster ? monster.name : "Draw!"
    end

    def self.battle_royale(title)
        title = title + " (Battle Royale!)"
        @monsters = Monster.all.shuffle
        @monsters.each_with_index do |monster, i|
            if i.even? && (@monsters.last == monster)
                #puts "no one for #{monster.name} to fight"
            elsif i.odd?
                fight = Fight.create(title: title, defender_id: monster.id, challenger_id: @monsters[i-1].id, location_id: Location.all.sample.id)
                fight.attack
                fight.save
            end
        end
    end


end
