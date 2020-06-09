class RoadTripInfo
  attr_reader :origin, :destination, :travel_time, :forecast, :id

  def initialize(travel_info, weather)
    @id = 42
    @origin = travel_info[:start_address]
    @destination = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = ArrivalForecast.new(weather, @travel_time)
  end
end
