class Fight < ApplicationRecord
    belongs_to :challenger, class_name: "Monster"
    belongs_to :defender, class_name: "Monster"
    belongs_to :location
   

    def location_attributes=(arg)
        self.location = Location.find_or_create_by(arg)
    end
end
