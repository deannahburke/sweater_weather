require 'rails_helper'

describe 'Forecast API' do
  it 'gets a successful response from internal api' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end

  context 'happy path' do
    it 'sends specified weather data for a location' do
      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq("forecast")
      expect(forecast[:data]).to have_key(:attributes)

      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)


      expect(forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
      expect((forecast[:data][:attributes][:daily_weather]).length).to eq(5)

      daily_weather = forecast[:data][:attributes][:daily_weather]

      expect(daily_weather[0]).to have_key(:date)
      expect(daily_weather[0][:date]).to be_a(String)
      expect(daily_weather[0]).to have_key(:sunrise)
      expect(daily_weather[0][:sunrise]).to be_a(String)
      expect(daily_weather[0]).to have_key(:sunset)
      expect(daily_weather[0][:sunset]).to be_a(String)
      expect(daily_weather[0]).to have_key(:max_temp)
      expect(daily_weather[0][:max_temp]).to be_a(Float)
      expect(daily_weather[0]).to have_key(:min_temp)
      expect(daily_weather[0][:min_temp]).to be_a(Float)
      expect(daily_weather[0]).to have_key(:conditions)
      expect(daily_weather[0][:conditions]).to be_a(String)
      expect(daily_weather[0]).to have_key(:icon)
      expect(daily_weather[0][:icon]).to be_a(String)

      expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
      expect((forecast[:data][:attributes][:hourly_weather]).length).to eq(8)

      hourly_weather = forecast[:data][:attributes][:hourly_weather]

      expect(hourly_weather[0]).to have_key(:time)
      expect(hourly_weather[0][:time]).to be_a(String)
      expect(hourly_weather[0]).to have_key(:temperature)
      expect(hourly_weather[0][:temperature]).to be_a(Float)
      expect(hourly_weather[0]).to have_key(:conditions)
      expect(hourly_weather[0][:conditions]).to be_a(String)
      expect(hourly_weather[0]).to have_key(:icon)
      expect(hourly_weather[0][:icon]).to be_a(String)
    end
  end

  context 'sad path' do
    xit 'sends specified weather data for a location' do
      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)

    end
  end
end
