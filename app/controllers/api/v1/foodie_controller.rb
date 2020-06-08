class Api::V1::FoodieController < ApplicationController
  def index
    destination_info = DestinationInfo.new(params['start'], params['end'])

    # conn = Faraday.new('https://maps.googleapis.com')
    # request = conn.get('/maps/api/directions/json?') do |r|
    #   r.params['origin'] = params['start']
    #   r.params['destination'] = params['end']
    #   r.params['units'] = 'imperial'
    #   r.params['key'] = ENV['GEOLOC_API_KEY']
    # end
    # json = JSON.parse(request.body, symbolize_names: true)
    # travel_time = json[:routes][0][:legs][0][:duration]
    restaurant_info = RestaurantInfo.new(params['search'])

    conn_2 = Faraday.new('https://developers.zomato.com')
    request_2 = conn_2.get('/api/v2.1/search?') do |r|
      r.params['category'] = params['search']
      r.params['apikey'] = ENV['ZOMATO_API_KEY']
    end
    json_2 = JSON.parse(request_2.body, symbolize_names: true)

    require "pry"; binding.pry
  end
end
