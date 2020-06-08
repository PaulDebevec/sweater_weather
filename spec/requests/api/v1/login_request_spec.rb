require 'rails_helper'

RSpec.describe 'User Login Endpoint Request' do
  it 'Returns user email and api key with a 200 status', :vcr do
    user = User.create( email: 'whatever@example.com',
                          password: 'password',
                          api_key: 'jij342lmk1oj5klj234KNLMn34kmKM436')

    post '/api/v1/sessions', params: {email: user.email,
                                      password: user.password}


    expect(response).to be_successful
    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(user.email).to eq(json[:data][:attributes][:email])
    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:attributes].keys.include?(:email)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:api_key)).to eq(true)
  end
end
