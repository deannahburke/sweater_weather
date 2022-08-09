class RoadTripFacade
  def self.create_roadtrip(origin, destination)
    json = MapService.get_directions(origin, destination)
  end
end
