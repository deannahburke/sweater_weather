class ForecastService < BaseService
  def self.conn
    url = "https://api.openweathermap.org/data/2.5/"
    Faraday.new(url: url)
  end

  def self.get_weather(lat, lon)
    response = conn.get("onecall?appid=#{ENV['openweather_api_key']}&lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&units=imperial")
    data = get_json(response)
  end
end
