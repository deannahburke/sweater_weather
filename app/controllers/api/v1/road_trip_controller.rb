class Api::V1::RoadTripController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]
    RoadTripFacade.create_roadtrip(origin, destination)
  end
end
