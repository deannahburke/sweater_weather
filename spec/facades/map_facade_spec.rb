require 'rails_helper'

RSpec.describe MapFacade do
  it 'creates location poro from get location service call' do
    location = ("Denver,CO")
    result = MapFacade.create_location(location)

    expect(result).to be_an_instance_of(Location)
  end
end
