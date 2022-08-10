require 'rails_helper'

RSpec.describe 'create roadtrip endpoint', :vcr do
  context 'happy path' do
    it 'sends formatted road trip data' do
      request_params =
        {
          origin: "Denver, CO",
          destination: "Pueblo, CO",
          api_key: "daed989c0fa9dd11a2b007a2bb74b87d"
        }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(request_params)

      roadtrip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(roadtrip).to have_key(:data)
      expect(roadtrip[:data]).to have_key(:id)
      expect(roadtrip[:data][:id]).to eq(nil)
      expect(roadtrip[:data]).to have_key(:type)
      expect(roadtrip[:data][:type]).to eq("roadtrip")
      expect(roadtrip[:data]).to have_key(:attributes)

      expect(roadtrip[:data][:attributes]).to have_key(:start_city)
      expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
      expect(roadtrip[:data][:attributes]).to have_key(:end_city)
      expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
      expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
      expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)
      #comment out until feature complete
      # expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
      # expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      # expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a_kind_of(Numeric)
      # expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      # expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
end
