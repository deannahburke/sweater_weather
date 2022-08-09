require 'rails_helper'

RSpec.describe ForecastService do
  describe 'external endpoint' do
    it 'can retrieve current forecast data for a given location' do

      mock_data = File.read('spec/fixtures/forecast.json')
      json = JSON.parse(mock_data, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:current)
      expect(json[:current]).to have_key(:dt)
      expect(json[:current]).to have_key(:sunrise)
      expect(json[:current]).to have_key(:sunset)
      expect(json[:current]).to have_key(:temp)
      expect(json[:current]).to have_key(:feels_like)
      expect(json[:current]).to have_key(:humidity)
      expect(json[:current]).to have_key(:uvi)
      expect(json[:current]).to have_key(:visibility)
      expect(json[:current]).to have_key(:weather)
      expect(json[:current][:weather]).to be_a(Array)
      expect(json[:current][:weather][0]).to have_key(:description)
      expect(json[:current][:weather][0]).to have_key(:icon)

      expect(json).to_not have_key(:minutely)
      expect(json).to_not have_key(:alerts)
    end

    it 'can retrieve hourly forecast data for a given location' do
      lat = 39.7392
      lon = -104.9903
      json = ForecastService.get_weather(lat, lon)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:hourly)
      expect(json[:hourly]).to be_a(Array)
      expect(json[:hourly][0]).to have_key(:dt)
      expect(json[:hourly][0]).to have_key(:temp)
      expect(json[:hourly][0]).to have_key(:weather)
      expect(json[:hourly][0][:weather][0]).to have_key(:description)
      expect(json[:hourly][0][:weather][0]).to have_key(:icon)

      expect(json).to_not have_key(:minutely)
      expect(json).to_not have_key(:alerts)
    end

    it 'can retrieve daily forecast data for a given location' do
      lat = 39.7392
      lon = -104.9903
      json = ForecastService.get_weather(lat, lon)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:daily)
      expect(json[:daily]).to be_a(Array)
      expect(json[:daily][0]).to have_key(:dt)
      expect(json[:daily][0]).to have_key(:sunrise)
      expect(json[:daily][0]).to have_key(:sunset)
      expect(json[:daily][0]).to have_key(:temp)
      expect(json[:daily][0][:temp]).to have_key(:min)
      expect(json[:daily][0][:temp]).to have_key(:max)
      expect(json[:daily][0][:weather][0]).to have_key(:description)
      expect(json[:daily][0][:weather][0]).to have_key(:icon)
      expect(json).to_not have_key(:minutely)
      expect(json).to_not have_key(:alerts)
    end
  end
end
