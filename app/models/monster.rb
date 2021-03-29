class Monster < ApplicationRecord
    has_many :fights_challenged, foreign_key: :challenger_id, class_name: "Fight" 
    has_many :defenders, through: :fights_challenged

    has_many :fights_defended, foreign_key: :defender_id, class_name: "Fight"
    has_many :challengers, through: :fights_defended
end
