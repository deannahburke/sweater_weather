class RestaurantFacade
  def self.create_restaurant(location, term)
    json = YelpService.get_restaurants(location, term)

    restaurants = json.map { |data| Restaurant.new(data) }
  end
end
