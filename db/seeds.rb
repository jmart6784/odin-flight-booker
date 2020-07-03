airport_collection = [
  Airport.create!(code: "LAX"), 
  Airport.create!(code: "SFO"), 
  Airport.create!(code: "LAS"), 
  Airport.create!(code: "SLC"), 
  Airport.create!(code: "DEN"), 
  Airport.create!(code: "ICT"), 
  Airport.create!(code: "STL"), 
  Airport.create!(code: "ORD"), 
  Airport.create!(code: "TPA"), 
  Airport.create!(code: "JFK")
]

valid_pairs = []
# Pair up valid pairs of Airports 5000 times
5000.times do
  from = airport_collection[rand(0..9)]
  to = airport_collection[rand(0..9)]

  next if from == to

  valid_pairs << [from, to]
end

valid_pairs.each do |valid_pair|
  from = valid_pair[0]
  to = valid_pair[1]

  # Random Day, hour and minute of flight
  r_days = rand(7..180)
  r_hours = rand(1..23)
  r_minutes = rand(1..59)
  # Random flight duration
  r_duration = rand(2..10)

  Flight.create!(
    departure_id: from.id, arrival_id: to.id, 
    start_date: Date.today + r_days.days, 
    start_time: (Date.today + r_days.days + r_hours.hours + r_minutes.minutes).strftime("%H:%M:%S"), 
    end_date: (Date.today + r_days.days + r_hours.hours + r_minutes.minutes + r_duration.hours).strftime("%Y-%m-%d"), 
    end_time: (Date.today + r_days.days + r_hours.hours + r_minutes.minutes + r_duration.hours).strftime("%H:%M:%S")
  )
end