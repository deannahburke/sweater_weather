require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'creates a forecast poro from get weather service call' do
    lat = (39.7392)
    lon = (-104.9903)
    forecast = ForecastFacade.create_forecast(lat, lon)

    expect(forecast).to be_a(Hash)
    expect(forecast[:current]).to be_a(CurrentForecast)
    expect(forecast[:daily]).to be_all(DailyForecast)
    expect(forecast[:hourly]).to be_all(HourlyForecast)
  end
end
