class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :arrival_id
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.timestamps
    end
  end
end
