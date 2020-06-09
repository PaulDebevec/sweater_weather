class RoadTripInfo
  attr_reader :origin, :destination, :travel_time, :forecast
  
  def initialize(travel_info, weather)
    @origin = travel_info[:start_address]
    @destination = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = ArrivalForecast.new(weather, @travel_time)
  end
end
