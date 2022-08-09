class RoadTrip
  attr_reader :travel_time,
              :hourly_destination_forecast,
              :daily_destination_forecast

  def initialize(trip, destination_forecast)
    @travel_time = trip[:route][:formattedTime]
    @hourly_destination_forecast = destination_forecast[:hourly]
    @daily_destination_forecast =  destination_forecast[:daily]
  end
end
