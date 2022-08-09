class ForecastSerializer
def self.format_forecast(forecast)
  {
    data: {
      id: nil,
      type: "forecast",
      attributes: {
        "current_weather":
        {
          "datetime": forecast[0].datetime,
          "sunrise": forecast[0].sunrise,
          "sunset": forecast[0].sunset,
          "temperature": forecast[0].temperature,
          "feels_like": forecast[0].feels_like,
          "humidity": forecast[0].humidity,
          "uvi": forecast[0].uvi,
          "visibility": forecast[0].visibility,
          "conditions": forecast[0].conditions,
          "icon": forecast[0].icon
        },
        "daily_weather": forecast[1].map do |daily|
        {
          "date": daily.date,
          "sunrise": daily.sunrise,
          "sunset": daily.sunset,
          "max_temp": daily.max_temp,
          "min_temp": daily.min_temp,
          "conditions": daily.conditions,
          "icon": daily.icon
        }
      end,
        "hourly_weather": forecast[2].map do |hourly|
        {
          "time": hourly.time,
          "temperature": hourly.temperature,
          "conditions": hourly.conditions,
          "icon": hourly.icon
        }
      end
      }
    }
  }
  end
end
