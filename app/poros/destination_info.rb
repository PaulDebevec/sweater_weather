class DestinationInfo
  def initialize(destination, restaurant)
    @travel_and_weather = TravelWeather.new(destination)
    @destination_restaurant = DestinationRestaurant.new(restaurant)
  end
end
