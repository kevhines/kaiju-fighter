class Location < ApplicationRecord
    has_many :fights
   
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    
    def make_name_titlecase
        self.name = self.name.titlecase
    end
end
