class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    roadtrip = RoadTripFacade.create_roadtrip(params[:origin], params[:destination])
    if user.blank? == false
      render json: RoadTripSerializer.format_roadtrip(roadtrip), status: 200
    else
      render json: { error: "Valid API Key Required" }, status: 401
    end
  end
end
