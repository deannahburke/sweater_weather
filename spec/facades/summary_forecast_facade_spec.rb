require 'rails_helper'

RSpec.describe SummaryForecastFacade do
  it 'creates a current forecast for destination city' do
    destination = ("denver,co")
    forecast = SummaryForecastFacade.destination_forecast(destination)
    
    expect(forecast[0]).to be_a(CurrentForecast)
  end
end
