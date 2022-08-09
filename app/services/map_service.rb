class MapService < BaseService
  def self.conn
    url = "http://www.mapquestapi.com/"
    Faraday.new(url: url)
  end

  def self.get_location(location)
    response = conn.get("geocoding/v1/address?key=#{ENV['mapquest_api_key']}&location=#{location}")
    data = get_json(response)
  end

  def self.get_directions(origin, destination)
    response = conn.get("directions/v2/route?key=#{ENV['mapquest_api_key']}&from=#{origin}&to=#{destination}")
    data = get_json(response)
  end
end
