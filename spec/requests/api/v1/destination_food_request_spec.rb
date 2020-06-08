require 'rails_helper'

RSpec.describe 'Zomato API' do
  it 'sends a restaurant near the destination of travel', :vcr do

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(json[:data][:attributes].keys.include?(:end_location)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:travel_time)).to eq(true)
    expect(json[:data][:attributes][:forecast].keys.include?(:summary)).to eq(true)
    expect(json[:data][:attributes][:forecast].keys.include?(:temperature)).to eq(true)
    expect(json[:data][:attributes][:restaurant].keys.include?(:name)).to eq(true)
    expect(json[:data][:attributes][:restaurant].keys.include?(:address)).to eq(true)
  end
end
