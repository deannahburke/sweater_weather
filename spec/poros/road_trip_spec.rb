require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists with attributes' do
    trip_data = File.read('spec/fixtures/trip.json')
    trip = JSON.parse(trip_data, symbolize_names: true)
    trip_weather = File.read('spec/fixtures/trip_weather.json')
    destination_forecast = JSON.parse(trip_weather, symbolize_names: true)

    roadtrip = RoadTrip.new(trip, destination_forecast)

    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.travel_time).to eq("01:45:23")
    expect(roadtrip.hourly_destination_forecast.length).to eq(48)
    expect(roadtrip.daily_destination_forecast.length).to eq(8)
  end
end
