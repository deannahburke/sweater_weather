require 'rails_helper'

RSpec.describe MapService do
  describe 'external endpoint' do
    it 'can lat and long for a location' do
      location = ("Denver,CO")
      json = MapService.get_location(location)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:results)
      expect(json[:results]).to be_a(Array)
      expect(json[:results][0]).to have_key(:locations)
      expect(json[:results][0][:locations]).to be_a(Array)
      expect(json[:results][0][:locations][0]).to have_key(:latLng)
      expect(json[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(json[:results][0][:locations][0][:latLng]).to have_key(:lng)
    end
  end
end
