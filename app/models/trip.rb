class Trip < ApplicationRecord
	# belongs_to :driver, :class_name => "User"
	has_many :places
    # has_and_belongs_to_many :source, :class_name => "Place"
	# has_and_belongs_to_many :destination, :class_name => "Place"
	belongs_to :user
	validates :numberOfSeats, :departure_time,:source, :destination , presence: true
	#    validates_numericality_of :numberOfSeats, :only_integer => true, :greater_than_or_equal_to => 3
	validates :numberOfSeats, numericality: {greater_than_or_equal_to: 3}
	validate :not_past_date


		def not_past_date
			if departure_time < Date.today
			errors.add(:departure_time, " departure_time can't be in past")
			end
		end
    
end
