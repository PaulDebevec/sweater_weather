class DestinationInfo
  attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(restaurant_info, travel_info, weather)
    @id = 'id'
    @end_location = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = DestinationForecast.new(weather)
    @restaurant = DestinationRestaurant.new(restaurant_info)
  end
end
