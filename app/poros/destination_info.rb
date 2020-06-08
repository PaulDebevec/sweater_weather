class DestinationInfo
  # attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(restaurant_info, travel_info, weather)
    # @end_location = DestinationWeather.new(destination)
    # require "pry"; binding.pry
    @end_location = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = {summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp]
    @restaurant =
    @destination_restaurant = DestinationRestaurant.new(restaurant)

    destination_forecast = ForecastInfo.new(weather, params[:location])
    require "pry"; binding.pry
  end
end

#
# class ForecastInfo
#   attr_reader :today_forecast, :weekly_forecast, :id
#
#   def initialize(weather, location)
#     @id = 1
#     @today_forecast = TodayForecast.new(weather, location)
#     @weekly_forecast = WeeklyForecast.new(weather)
#   end
# end
