require 'rails_helper'

describe 'Munchies API' do
  it 'gets a successful response from  internal api' do
    get '/api/v1/munchies?location=denver,co&food=bbq'

    expect(response).to be_successful
  end

  context 'happy path' do
    it 'sends weather data for restaurant location' do
      get '/api/v1/munchies?location=denver,co&food=bbq'

      destination = JSON.parse(response.body, symbolize_names: true)

      expect(destination).to have_key(:data)
      expect(destination[:data]).to have_key(:id)
      expect(destination[:data][:id]).to eq(nil)
      expect(destination[:data][:type]).to eq("munchie")
      expect(destination[:data]).to have_key(:attributes)

      expect(destination[:data][:attributes]).to have_key(:destination_city)
      expect(destination[:data][:attributes]).to have_key(:forecast)
      expect(destination[:data][:attributes]).to have_key(:restaurant)

      expect(destination[:data][:attributes][:destination_city][:forecast]).to have_key(:summary)
      expect(destination[:data][:attributes][:destination_city][:forecast]).to have_key(:temperature)

      expect(expect(destination[:data][:attributes][:restaurant]).to have_key(:name)
      expect(expect(destination[:data][:attributes][:restaurant]).to have_key(:address)
    end
end
