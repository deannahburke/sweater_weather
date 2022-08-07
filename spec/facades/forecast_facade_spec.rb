require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'creates a forecast poro from get weather service call' do
    lat = (39.7392)
    lon = (-104.9903)
    forecast = ForecastFacade.create_forecast(lat, lon)

    expect(forecast).to be_a(Array)
    expect(forecast[0]).to be_a(CurrentForecast)

    expect(forecast[1]).to be_all(DailyForecast)
    expect(forecast[1].length).to eq(5)
    expect(forecast[1].length).to_not eq(7)

    expect(forecast[2]).to be_all(HourlyForecast)
    expect(forecast[2].length).to eq(8)
    expect(forecast[2].length).to_not eq(24)
  end
end
