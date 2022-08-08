require 'rails_helper'

RSpec.describe SummaryForecastFacade do
  it 'creates a summary of current forecast from weather service call' do
    lat = (39.7392)
    lon = (-104.9903)
    forecast = SummaryForecastFacade.create_forecast(lat, lon)

    expect(forecast).to be_a(Array)
    expect(forecast[0]).to be_a(SummaryForecast)
  end
end
