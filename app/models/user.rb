class User < ApplicationRecord 

  enum role: [:driver, :passenger]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :pickups
  has_many :trips


  validates :full_name, :phone_number, presence: true
  validates_length_of :full_name, :minimum => 6
  validates :phone_number, uniqueness:true

end
