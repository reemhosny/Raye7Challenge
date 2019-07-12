json.extract! trip, :id, :source, :destination, :departure_time, :numberOfSeats, :created_at, :updated_at
json.url trip_url(trip, format: :json)
