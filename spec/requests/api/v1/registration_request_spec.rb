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
    expect(user.email).to eq(json[:data][:attributes][:email])
    expect(user.api_key).to be_truthy
    expect(user.password_digest).to be_truthy
  end

  it 'sends a failed 400 message if email is taken' do
    user_1 = User.create( email: 'whatever@example.com',
                          password: 'password',
                          api_key: 'jij342lmk1oj5klj234KNLMn34kmKM436')
    user_params = {'email' => 'whatever@example.com',
                  'password' => 'password',
                  'password_confirmation' => 'password'}

    post '/api/v1/users', params: {user: user_params}
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq("Email has already been taken")
  end

  it 'sends a failed 400 message if password confirmation is incorrect' do
    user_params = {'email' => 'whatever@example.com',
                  'password' => 'password',
                  'password_confirmation' => 'incorrectPasswordConfirmation'}

    post '/api/v1/users', params: {user: user_params}
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq("Password confirmation doesn't match Password")
  end

  it 'sends a failed 400 message if a field is missing user input' do
    user_params = {'password' => 'password',
                   'password_confirmation' => 'password'}

    post '/api/v1/users', params: {user: user_params}
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    expect(json[:errors]).to eq("Email can't be blank")
  end
end
