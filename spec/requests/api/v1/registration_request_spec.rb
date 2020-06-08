require 'rails_helper'

RSpec.describe 'Registration Endpoint' do
  it 'Sends a successful 201 response for a user', :vcr do
    user_params = {'email' => 'whatever@example.com',
                  'password' => 'password',
                  'password_confirmation' => 'password'}

    post '/api/v1/users', params: {user: user_params}
    user = User.last

    expect(response).to be_successful
    expect(response.status).to eq(201)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(user.email).to eq(json[:email])
    expect(user.api_key).to be_truthy
    expect(user.password_digest).to be_truthy

  end
end
