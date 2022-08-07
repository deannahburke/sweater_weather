class HourlyForecast
  attr_reader :time

  def initialize(data)
    @time = Time.at(data[:dt]).strftime("%H:%M:%S")
  end
end
