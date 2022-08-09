require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists with attributes' do
    origin = ("Denver,CO")
    destination = ("Pueblo,CO")
    trip_data = File.read('spec/fixtures/trip.json')
    trip = JSON.parse(trip_data, symbolize_names: true)
    trip_weather = File.read('spec/fixtures/trip_weather.json')
    destination_forecast = JSON.parse(trip_weather, symbolize_names: true)

    roadtrip = RoadTrip.new(origin, destination, trip, destination_forecast)

    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.start_city).to eq("Denver,CO")
    expect(roadtrip.end_city).to eq("Pueblo,CO")
    expect(roadtrip.travel_time).to eq("01:45:23")
    expect(roadtrip.hourly_destination_forecast.length).to eq(48)
    expect(roadtrip.daily_destination_forecast.length).to eq(8)
  end
end
