require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'sends weather forecast for location', :vcr do

    get '/api/v1/forecast?location=berthoud,colorado'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(json[:data][:attributes].keys.include?(:today_forecast)).to eq(true)
    expect(json[:data][:attributes].keys.include?(:weekly_forecast)).to eq(true)
  end
end
