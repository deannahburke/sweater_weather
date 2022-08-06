class MapService < BaseService
  def self.conn
    url = "http://www.mapquestapi.com/geocoding/v1/"
    Faraday.new(url: url)
  end

  def self.get_location(location)
    response = conn.get("address?key=#{ENV['mapquest_api_key']}&location=#{location}")
    data = get_json(response)
    
  end
end
