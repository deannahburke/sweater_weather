require 'rails_helper'

RSpec.describe 'create login endpoint' do
  context 'happy path' do
    it 'can log in a user' do
      user = User.create!({
        email: "sai@magical.com",
        password: "123bean",
        api_key: "nauan3y498679826"
      })

      user_params =
        {
          email: "sai@magical.com",
          password: "123bean"
        }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:id]).to eq(user.id)
      expect(body[:data][:attributes]).to have_key(:email)
      expect(body[:data][:attributes][:email]).to eq(user.email)
      expect(body[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(body[:data][:attributes]).to_not have_key(:password)
    end
  end
end
