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
end
