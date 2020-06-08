class Api::V1::FoodieController < ApplicationController
  def index
    travel_info = TravelService.get_dest_info(params['start'], params['end'])
    weather = OpenWeatherService.get_weather(coords[:lat], coords[:lng])
    restaurant_info = RestaurantService.get_restaurant(params['search'])

    forecast_info = ForecastInfo.new(weather, params[:location])
    # weather_info =

  end
end
