require 'rails_helper'

RSpec.describe RestaurantFacade do
  it 'creates restaurant objects from yelp service call' do
    location = ("denver,co")
    term = ("bbq")

    restaurant = RestaurantFacade.create_restaurant(location, term)
    require "pry";binding.pry
    expect(restaurant).to be_a(Array)
  end
end
