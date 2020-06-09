require 'rails_helper'

RSpec.describe 'Road Trip request' do
  it 'with valid api_key returns the trip details', :vcr do
    trip_params = { "origin": "Denver,CO",
                    "destination": "Pueblo,CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"}
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:attributes].keys.include?(:origin)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:destination)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:travel_time)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:forecast)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:forecast)).to eq(true)

    json_weather = json[:data][:attributes][:forecast][:weather]
    expect(json_weather.keys.include?(:temp)).to eq(true)
    expect(json_weather.keys.include?(:description)).to eq(true)
  end
end
