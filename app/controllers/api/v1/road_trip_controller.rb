class Api::V1::RoadTripController < ApplicationController
  def create
    travel_info = TravelService.get_travel_info(params['origin'], params['destination'])
    lat = travel_info[:end_location][:lat]
    lng = travel_info[:end_location][:lng]
    weather = OpenWeatherService.get_weather(lat, lng)
    road_trip_info = RoadTripInfo.new(travel_info, weather)

  end
end
