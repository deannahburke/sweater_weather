class ForecastFacade
  def self.create_forecast(lat, lon)
    json = ForecastService.get_weather(lat, lon)
    Forecast.new(json)
  end
end
