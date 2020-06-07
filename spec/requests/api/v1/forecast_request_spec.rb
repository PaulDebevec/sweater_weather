require 'rails_helper'

RSpec.describe 'Forecast API' do

  it 'sends weather forecast for location', :vcr do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
  end
end
