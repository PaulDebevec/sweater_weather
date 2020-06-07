class Background
  attr_reader :id, :url
  def initialize(background_info)
    @id = background_info[:id]
    @url = background_info[:urls][:full]
  end
end
