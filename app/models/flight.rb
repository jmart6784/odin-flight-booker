class Flight < ApplicationRecord
  belongs_to :from, foreign_key: "departure_id", class_name: "Airport"
  belongs_to :to, foreign_key: "arrival_id", class_name: "Airport"

  validates :departure_id, :arrival_id, :start_date, :start_time, :end_date,:end_time, presence: true
end