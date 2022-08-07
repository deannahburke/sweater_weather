class ForecastFacade
  def self.create_forecast(lat, lon)
    json = ForecastService.get_weather(lat, lon)

    current = CurrentForecast.new(json)

    daily = json[:daily][0..4].map { |data| DailyForecast.new(data) }

    hourly = json[:hourly][0..7].map { |data| HourlyForecast.new(data) }

    {current: current, daily: daily, hourly: hourly}
  end
end
