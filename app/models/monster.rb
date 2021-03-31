class Monster < ApplicationRecord
    belongs_to :user
 
    has_many :fights_challenged, foreign_key: :challenger_id, class_name: "Fight" 
    has_many :defenders, through: :fights_challenged

    has_many :fights_defended, foreign_key: :defender_id, class_name: "Fight"
    has_many :challengers, through: :fights_defended

    validates :name, presence: true

    def all_fights
        self.fights_challenged + self.fights_defended
    end

    
    def self.health_change(winner:, loser:)
        self.all.each do |monster|
            if monster.id == winner
                monster.health = monster.health - 20
            elsif monster.id == loser
                monster.health = (monster.health - 20)/2
           else
                monster.health = monster.health + 10
            end
            monster.health = 1 if monster.health < 1
            monster.health = 100 if monster.health > 100
            monster.save
        end
    end
end
