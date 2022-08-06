class MapFacade
  def self.create_location(location)
    json = MapService.get_location(location)
    Location.new(json[:results][0][:locations][0][:latLng])
  end
end
