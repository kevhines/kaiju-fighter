class Monster < ApplicationRecord
    belongs_to :user
 
    has_many :fights_challenged, foreign_key: :challenger_id, class_name: "Fight" 
    has_many :defenders, through: :fights_challenged

    has_many :fights_defended, foreign_key: :defender_id, class_name: "Fight"
    has_many :challengers, through: :fights_defended

    validates :name, presence: true

    before_save :size_check

    scope :strongest, -> { where("health >= 70") }
    scope :strong_to_weak, -> { order('health DESC')}

    def size_check
        if self.size < 5
            self.size = 5
        elsif self.size > 80
            self.size = 80
        end
    end

    def all_fights
        self.fights_challenged + self.fights_defended
    end

    def wins
        self.all_fights.count{ |w| w.winner == self.id }
    end

    def losses
        self.all_fights.count{ |w| w.winner != self.id }
    end

    def win_percentage
        self.all_fights.count == 0 ? 0 : (self.wins.to_f/self.all_fights.count.to_f)
    end

    def self.monster_ranked
        self.all.sort_by { |m| m.win_percentage}.reverse
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
