require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do
  it 'creates a roadtrip poro from roadtrip service call' do
    origin = ("Denver,CO")
    destination = ("Pueblo,CO")
    
    result = RoadTripFacade.create_roadtrip(origin, destination)

    expect(result).to be_an_instance_of(RoadTrip)
  end
end
