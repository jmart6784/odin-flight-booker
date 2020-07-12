class Flight < ApplicationRecord
  belongs_to :departure, foreign_key: "departure_id", class_name: "Airport"
  belongs_to :arrival, foreign_key: "arrival_id", class_name: "Airport"
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  validates :departure_id, :arrival_id, :start_date, :start_time, :end_date,:end_time, presence: true
end