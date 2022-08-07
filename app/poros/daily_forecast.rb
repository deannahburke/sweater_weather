class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset

  def initialize(data)
    @date = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
  end
end
