class Api::V1::FoodieController < ApplicationController
  def index
    travel_info = TravelService.get_travel_info(params['start'], params['end'])
    # lat = travel_info[:routes][0][:legs][0][:end_location][:lat]
    # lng = travel_info[:routes][0][:legs][0][:end_location][:lng]
    # weather = OpenWeatherService.get_weather(lat, lng)
    # require "pry"; binding.pry
    restaurant_info = RestaurantService.get_restaurant(params['search'])

    # forecast_info = ForecastInfo.new(weather, params[:location])

  end
end
