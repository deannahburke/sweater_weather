class RestaurantFacade
  def self.create_restaurant(location, term)
    json = YelpService.get_restaurants(location, term)
    restaurants = Restaurant.new(json) 
  end
end
