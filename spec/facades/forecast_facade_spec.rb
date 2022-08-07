require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'creates a forecast poro from get weather service call' do
    lat = (39.7392)
    lon = (-104.9903)
    result = ForecastFacade.create_forecast(lat, lon)

    expect(result).to be_an_instance_of(Forecast)
  end
end
