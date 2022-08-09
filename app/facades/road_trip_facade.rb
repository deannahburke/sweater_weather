class RoadTripFacade
  def self.create_roadtrip(origin, destination)
    trip = MapService.get_directions(origin, destination)
    location = MapFacade.create_location(destination)
    destination_forecast = ForecastService.get_weather(location.latitude, location.longitude)
    RoadTrip.new(origin, destination, trip, destination_forecast)
  end
end