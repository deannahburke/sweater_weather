require 'rails_helper'

RSpec.describe MapService, :vcr do
  describe 'external endpoint' do
    it 'can lat and long for a location' do

      location = ("denver,co")
      json = MapService.get_location(location)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:results)
      expect(json[:results]).to be_a(Array)
      expect(json[:results][0]).to have_key(:locations)
      expect(json[:results][0][:locations]).to be_a(Array)
      expect(json[:results][0][:locations][0]).to have_key(:latLng)
      expect(json[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(json[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(json[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
      expect(json[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
    end

    it 'can get directions from different endpoint' do
      origin = ("Denver,CO")
      destination = ("Pueblo,CO")
      json = MapService.get_directions(origin, destination)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:route)
      expect(json[:route]).to have_key(:formattedTime)
      expect(json[:route][:formattedTime]).to be_a(String)
      expect(json[:route][:formattedTime]).to eq("01:45:23")
    end
  end
end
