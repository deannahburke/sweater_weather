require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast for a location' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
