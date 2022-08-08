class RestaurantSerializer
  def self.format_restaurant(restaurant, location, forecast)
    require "pry";binding.pry
    {
      data: {
        id: nil,
        type: "munchies",
        attributes: {
          "destination_city": location,
          "forecast": {
            "summary": forecast[0].conditions,
            "temperature": forecast[0].temperature
          },
          "restaurant": {
            "name":
            "address":
            }
          }
        }
      }
    }
  end
end
