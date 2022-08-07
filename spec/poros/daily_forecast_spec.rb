require 'rails_helper'

RSpec.describe DailyForecast do
  it 'exists with attributes' do
  mock_data = File.read('spec/fixtures/forecast.json')
  json = JSON.parse(mock_data, symbolize_names: true)
  daily = DailyForecast.new(json[:daily][0])

  expect(daily).to be_an_instance_of(DailyForecast)
  expect(daily.date).to eq("2022-08-06 13:00:00.000000000 -0600")
  expect(daily.sunrise).to eq("2022-08-06 06:03:39.000000000 -0600")
  expect(daily.sunset).to eq("2022-08-06 20:08:02.000000000 -0600")
  expect(daily.max_temp).to eq(90.12)
  expect(daily.min_temp).to eq(73)
  expect(daily.conditions).to eq("light rain")
  expect(daily.icon).to eq("10d")
  end
end
