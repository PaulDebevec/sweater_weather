class DestinationInfo
  def initialize(start, destination)
    @destination = DestinationService.new(start, destination)
  end
end
