class DestinationForecast
  def initialize(weather)
    @summary = weather[:current][:weather][0][:description]
    @temperature = weather[:current][:temp].round
  end
end
