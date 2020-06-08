class DestinationRestaurant
  def initialize(restaurant)
    @name = restaurant[:restaurants].pop[:restaurant][:name]
    @address = restaurant[:restaurants].pop[:restaurant][:location][:address]
  end
end
