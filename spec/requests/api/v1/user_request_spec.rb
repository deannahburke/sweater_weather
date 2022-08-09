require 'rails_helper'

RSpec.describe 'create user endpoint' do
  context 'happy path' do
    it 'can create a new user' do
      user_params =
        {
          email: "sai@magical.com",
          password: "123bean",
          password_confirmation: "123bean"
        }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      new_user = User.last

      expect(response).to be_successful
      expect(response).to have_http_status(201)
      expect(new_user.email).to eq("sai@magical.com")
      expect(new_user.password).to eq(nil)
    end

    it 'new user data is formatted correctly' do
      user_params =
        {
          email: "sai@magical.com",
          password: "123bean",
          password_confirmation: "123bean"
        }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(Integer)
      expect(user[:data][:type]).to eq("users")
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes]).to_not have_key(:password)
    end
  end

  context 'sad path' do
    it 'will not create user without email' do
      user_params =
      {
        email: "",
        password: "123bean",
        password_confirmation: "123bean"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(body[:error]).to eq("Email can't be blank")
    end

    it 'will not create user without matching passwords' do
      user_params =
        {
          email: "sai@magical.com",
          password: "",
          password_confirmation: "321bean"
        }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(body[:error]).to eq("Password can't be blank")
    end

    it 'will not create user without matching passwords' do
      user_params =
        {
          email: "sai@magical.com",
          password: "123bean",
          password_confirmation: "321bean"
        }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(body[:error]).to eq("Password confirmation doesn't match Password")
    end
  end
end
