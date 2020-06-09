require 'rails_helper'

RSpec.describe 'Road Trip request' do
  it 'with valid api_key returns the trip details', :vcr do
    trip_params = { "origin": "Denver,CO",
                    "destination": "Pueblo,CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"}
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(200)
  end
end

# REQUEST
# POST /api/v1/road_trip
# Content-Type: application/json
# Accept: application/json
#
# body:
#
# { "origin": "Denver,CO",
#   "destination": "Pueblo,CO",
#   "api_key": "jgn983hy48thw9begh98h4539h4"}

# RESPONSE
# status: 200
# body:
# {
#   "data": {
#     "type": "road_trip",
#     "id": 1,
#     "attributes": {
#       "origin": 'Denver, CO',
#       "destination": 'Pueblo, CO',
#       "travel_time": '1.48 hours',
#       "arrival_forecast": '74, mostly sunny'
#     }
#   }
# }
