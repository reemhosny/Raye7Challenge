class Trip < ApplicationRecord
    belongs_to :driver, :class_name => "User"
	belongs_to :source, :class_name => "Place"
	belongs_to :destination, :class_name => "Place"
	has_and_belongs_to_many :users

	validates :number_of_seats, :departure_time, presence: true
	#    validates_numericality_of :numberOfSeats, :only_integer => true, :greater_than_or_equal_to => 3
	validates :numberOfSeats, numericality: {greater_than_or_equal_to: 3}
	validate :not_past_date

		def not_past_date
			if departure_time < Date.today
			errors.add(:departure_time, " departure_time can't be in past")
			end
		end
    
end
