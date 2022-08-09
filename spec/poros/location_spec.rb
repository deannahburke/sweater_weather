require 'rails_helper'

RSpec.describe Location do
  it 'exists with attributes' do
    data = ({:lat=>39.738453, :lng=>-104.984853})
    denver = Location.new(data)

    expect(denver).to be_an_instance_of(Location)
    expect(denver.latitude).to eq(39.738453)
    expect(denver.longitude).to eq(-104.984853)
  end
end
