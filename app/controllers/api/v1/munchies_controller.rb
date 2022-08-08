class Api::V1::MunchiesController < ApplicationController
  def index
    location = MapFacade.create_location(params[:location])
    restaurant = RestaurantFacade.create_restaurant(location, term)
    render json: RestaurantSerializer.format_restaurant(restaurant)
  end
end
