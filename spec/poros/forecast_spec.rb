require 'rails_helper'

RSpec.describe Forecast do
  it 'exists with attributes' do
    mock_data = File.read('spec/fixtures/forecast.json')
    json = JSON.parse(mock_data, symbolize_names: true)
    forecast = Forecast.new(json)

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.datetime).to eq(Time.at(1659815043))
    expect(forecast.sunrise).to eq(Time.at(1659787419))
    expect(forecast.sunset).to eq(Time.at(1659838082))
    expect(forecast.temperature).to eq(89.42)
    expect(forecast.feels_like).to eq(88.41)
    expect(forecast.humidity).to eq(35)
    expect(forecast.uvi).to eq(8.68)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.conditions).to eq("few clouds")
    expect(forecast.icon).to eq("02d")
  end
end
