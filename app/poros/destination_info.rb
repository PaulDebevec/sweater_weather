class DestinationInfo
  # attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(destination, restaurant)
    @end_location = DestinationWeather.new(destination)
    @destination_restaurant = DestinationRestaurant.new(restaurant)
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
