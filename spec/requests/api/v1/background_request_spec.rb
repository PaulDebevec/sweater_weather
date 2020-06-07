require 'rails_helper'

RSpec.describe 'Unsplash API' do
  it 'sends an image for location', :vcr do
    location = "berthoud, CO"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(json[:data][:attributes].keys.include?(:url)).to eq(true)
    expect(json[:data].keys.include?(:id)).to eq(true)
    expect(json[:data].keys.include?(:type)).to eq(true)
    expect(json[:data][:type]).to eq("backgrounds")
  end
end
