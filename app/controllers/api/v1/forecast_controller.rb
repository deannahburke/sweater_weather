class Api::V1::ForecastController < ApplicationController
  def index
    location = MapFacade.create_location(params[:location])
    forecast = ForecastFacade.create_forecast(location.latitude, location.longitude)
    render json: ForecastSerializer.format_forecast(forecast)
  end
end
