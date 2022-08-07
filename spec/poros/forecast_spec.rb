require 'rails_helper'

RSpec.describe CurrentForecast do
  it 'exists with attributes' do
    mock_data = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(mock_data, symbolize_names: true)
    forecast = CurrentForecast.new(json)

    expect(forecast).to be_an_instance_of(CurrentForecast)
    expect(forecast.datetime).to eq("2022-08-06 13:44:03 -0600")
    expect(forecast.sunrise).to eq("2022-08-06 06:03:39 -0600")
    expect(forecast.sunset).to eq("2022-08-06 20:08:02 -0600")
    expect(forecast.temperature).to eq(89.42)
    expect(forecast.feels_like).to eq(88.41)
    expect(forecast.humidity).to eq(35)
    expect(forecast.uvi).to eq(8.68)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.conditions).to eq("few clouds")
    expect(forecast.icon).to eq("02d")
  end


end
