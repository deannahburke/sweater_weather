require 'rails_helper'

describe 'Munchies API' do
  it 'gets a successful response from  internal api' do
    get '/api/vi/munchies?location=denver,co&food=bbq'

    expect(response).to be_successful
  end 
