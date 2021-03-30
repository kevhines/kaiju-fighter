class Location < ApplicationRecord
    has_many :fights
    before_save :make_name_titlecase
    
    def make_name_titlecase
        self.name = self.name.titlecase
    end
end
