class Api::V1::ForecastController < ApplicationController

  def index
    coords = GeoLocationService.get_coords(params[:location])
    weather = OpenWeatherService.get_weather(coords[:lat], coords[:lng])
    forecast_info = ForecastInfo.new(weather, params[:location])
    render json: ForecastInfoSerializer.new(forecast_info)
  end
end
