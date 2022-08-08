require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists with attributes' do
    mock_data = File.read('spec/fixtures/yelp_bbq.json')

    json = JSON.parse(mock_data, symbolize_names: true)

    restaurant = Restaurant.new(json)
    
    expect(restaurant).to be_an_instance_of(Restaurant)
    expect(restaurant.name).to eq("Smokin' Yards BBQ")
    expect(restaurant.address).to eq("900 W 1st Ave Ste 100 Denver CO 80223")
  end
end
