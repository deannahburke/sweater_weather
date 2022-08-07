require 'rails_helper'

RSpec.describe HourlyForecast do
  it 'exists with attributes' do
    mock_data = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(mock_data, symbolize_names: true)
    hourly = HourlyForecast.new(json[:hourly][0])

    expect(hourly).to be_an_instance_of(HourlyForecast)
    expect(hourly.time).to eq("13:00:00")
    expect(hourly.temperature).to eq(89.38)
    expect(hourly.conditions).to eq("few clouds")
    expect(hourly.icon).to eq("02d")
  end
end
