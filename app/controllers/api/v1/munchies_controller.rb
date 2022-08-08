class Api::V1::MunchiesController < ApplicationController
  def index
    location = params[:location]
    term = params[:food]
    forecast = SummaryForecastFacade.destination_forecast(location)
    restaurant = RestaurantFacade.create_restaurant(location, term)
    render json: RestaurantSerializer.format_restaurant(restaurant)
  end
end
