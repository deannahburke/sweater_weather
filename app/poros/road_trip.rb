class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :hourly_destination_forecast,
              :daily_destination_forecast

  def initialize(origin, destination, trip, destination_forecast)
    @start_city = origin
    @end_city = destination
    @travel_time = trip[:route][:formattedTime]
    @hourly_destination_forecast = destination_forecast[:hourly]
    @daily_destination_forecast =  destination_forecast[:daily]
  end
end
