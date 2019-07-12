class Place < ApplicationRecord
    belongs_to :pickup 
    belongs_to :trip

    validates :name, uniqueness:true
    validates :longitude, uniqueness: { scope: :latitude }
end
