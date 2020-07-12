class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings

  validates :name, :email, presence: true
  # validates :name, :email, :booking_id, presence: true
end