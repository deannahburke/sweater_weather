require 'rails_helper'

RSpec.describe YelpService do
  describe 'external endpoint' do
    it 'can retrieve restaurant data for a location and type' do

      mock_data = File.read('spec/fixtures/yelp_bbq.json')
      json = JSON.parse(mock_data, symbolize_names: true)

      location = ("denver,co")
      term = ("bbq")
      result = YelpService.get_restaurants(location, term)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:businesses)
      expect(json[:businesses][0]).to have_key(:name)
      expect(json[:businesses][0]).to have_key(:location)
      expect(json[:businesses][0][:location]).to have_key(:address1)
      expect(json[:businesses][0][:location]).to have_key(:address2)
      expect(json[:businesses][0][:location]).to have_key(:city)
      expect(json[:businesses][0][:location]).to have_key(:state)
      expect(json[:businesses][0][:location]).to have_key(:zip_code)
    end
  end
end
