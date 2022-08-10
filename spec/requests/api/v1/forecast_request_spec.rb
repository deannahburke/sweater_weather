require 'rails_helper'

describe 'Forecast API', :vcr do
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
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a_kind_of(Numeric)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a_kind_of(Numeric)
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
      expect(hourly_weather[0][:temperature]).to be_a_kind_of(Numeric)
      expect(hourly_weather[0]).to have_key(:conditions)
      expect(hourly_weather[0][:conditions]).to be_a(String)
      expect(hourly_weather[0]).to have_key(:icon)
      expect(hourly_weather[0][:icon]).to be_a(String)
    end
  end

  context 'sad path' do
    it 'sends only specified weather data for a location' do
      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to_not have_key(:lat)
      expect(forecast).to_not have_key(:lon)
      expect(forecast).to_not have_key(:timezone)
      expect(forecast).to_not have_key(:daily)
      expect(forecast).to_not have_key(:hourly)
      expect((forecast[:data][:attributes][:daily_weather]).length).to_not eq(7)
      expect((forecast[:data][:attributes][:hourly_weather]).length).to_not eq(24)

      expect(forecast[:data][:attributes]).to_not have_key(:dt)
      expect(forecast[:data][:attributes]).to_not have_key(:pressure)
      expect(forecast[:data][:attributes]).to_not have_key(:dew_point)
      expect(forecast[:data][:attributes]).to_not have_key(:clouds)
      expect(forecast[:data][:attributes]).to_not have_key(:weather)

      daily_weather = forecast[:data][:attributes][:daily_weather]

      expect(daily_weather[0]).to_not have_key(:dt)
      expect(daily_weather[0]).to_not have_key(:moonrise)
      expect(daily_weather[0]).to_not have_key(:moonset)
      expect(daily_weather[0]).to_not have_key(:temp)

      hourly_weather = forecast[:data][:attributes][:hourly_weather]

      expect(hourly_weather[0]).to_not have_key(:dt)
      expect(hourly_weather[0]).to_not have_key(:feels_like)
      expect(hourly_weather[0]).to_not have_key(:pressure)
      expect(hourly_weather[0]).to_not have_key(:humidity)
    end
  end
end
