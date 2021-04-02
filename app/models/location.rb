class Location < ApplicationRecord
    has_many :fights
   
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    scope :wrecked, -> { where("health <= 40") }
    scope :weak_to_strong, -> { order('health')}
    
    def make_name_titlecase
        self.name = self.name.titlecase
    end

    def self.health_change(battle_site:)
        self.all.each do |location|
            if location.id == battle_site
                location.health = location.health/2
            else
                location.health = location.health + 15
            end
            location.health = 1 if location.health < 1
            location.health = 100 if location.health > 100
            location.save
        end
    end

end
