class Api::V1::FoodieController < ApplicationController
  def index
    conn = Faraday.new('https://maps.googleapis.com')
    request = conn.get('/maps/api/directions/json?') do |r|
      r.params['origin'] = params['start']
      r.params['destination'] = params['end']
      r.params['units'] = 'imperial'
      r.params['key'] = ENV['GEOLOC_API_KEY']
    end
    json = JSON.parse(request.body, symbolize_names: true)
    travel_time = json[:routes][0][:legs][0][:duration]

    
    require "pry"; binding.pry
  end
end
