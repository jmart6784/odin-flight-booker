class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings

  validates :name, :email, :booking_id, presence: true
end