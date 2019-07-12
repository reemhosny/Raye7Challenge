class Pickup < ApplicationRecord
 belongs_to :user
 has_many :places

 validate :not_past_date

 def not_past_date
    if departure_time.past?
       errors.add(:departure_time, " departure_time can't be in past")
    end
 end

end
