require 'rails_helper'

RSpec.describe MapService do
  describe 'external endpoint' do
    it 'can lat and long for a location' do

      mock_data = File.read('spec/fixtures/denver_mapquest.json')
      json = JSON.parse(mock_data, symbolize_names: true)

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
  end
end
