class DestinationInfo
  attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(restaurant_info, travel_info, weather)
    @id = 'id'
    @end_location = travel_info[:end_address]
    @travel_time = travel_info[:duration][:text]
    @forecast = {summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp].round}
    @restaurant = {name: restaurant_info[:restaurants].pop[:restaurant][:name], address: restaurant_info[:restaurants].pop[:restaurant][:location][:address]}
  end
end
