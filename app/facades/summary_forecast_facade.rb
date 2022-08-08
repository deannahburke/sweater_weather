class SummaryForecastFacade
  def self.destination_forecast(destination)
    location = MapFacade.create_location(destination)
    forecast = ForecastFacade.create_forecast(location.latitude, location.longitude)
  end
end
