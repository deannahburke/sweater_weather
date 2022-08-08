require 'rails_helper'

RSpec.describe 'create user endpoint' do
  context 'happy path' do
    it 'can create a new user' do
      user_params = ({
        "email": "sai@magical.com",
        "password": "123bean",
        "password_confirmation": "123bean"
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      new_user = User.last
      expect(response).to be_successful
      expect(response).to have_http_status(201)
      expect(new_user.email).to eq("sai@magical.com")
    end
  end
end
