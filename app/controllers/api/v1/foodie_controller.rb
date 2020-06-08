class Api::V1::FoodieController < ApplicationController
  def index
    travel_info = TravelService.get_travel_info(params['start'], params['end'])
    lat = travel_info[:end_location][:lat]
    lng = travel_info[:end_location][:lng]
    weather = OpenWeatherService.get_weather(lat, lng)
    restaurant_info = RestaurantService.get_restaurant(params['search'], lat, lng)
    destination_info = DestinationInfo.new(restaurant_info, travel_info, weather)
  end
end
