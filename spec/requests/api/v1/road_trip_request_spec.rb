require 'rails_helper'

RSpec.describe 'create roadtrip endpoint', :vcr do
  it 'gets successful response from internal api' do
    post '/api/v1/road_trip'

    expect(response).to be_successful
  end
end
