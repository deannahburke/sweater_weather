class YelpService < BaseService
  def self.conn
    url = "https://api.yelp.com/v3/"
    Faraday.new(url: url)
  end

  def self.get_restaurants(location, term)
    response = conn.get("businesses/search?location=#{location}&term=#{term}") do |faraday|
      faraday.headers["Authorization"] = ENV['yelp_api_key']
    end
    data = get_json(response)
  end
end
