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

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
