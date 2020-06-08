require 'rails_helper'

RSpec.describe 'Zomato API' do
  it 'sends a restaurant near the destination of travel', :vcr do

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(json[:data][:attributes].keys.include?(:url)).to eq(true)
    expect(json[:data].keys.include?(:id)).to eq(true)
    expect(json[:data].keys.include?(:type)).to eq(true)
    expect(json[:data][:type]).to eq("backgrounds")
  end
end
