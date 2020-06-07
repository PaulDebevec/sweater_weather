class GeoLocationService

  def self.get_coords(loc)
    required_params = "?address=#{loc}&key=#{ENV['GEOLOC_API_KEY']}"
    request = conn.get("/maps/api/geocode/json#{required_params}")
    json = JSON.parse(request.body, symbolize_names: true)
    json[:results][0][:geometry][:location]
  end

  private
  def self.conn
    Faraday.new('https://maps.googleapis.com')
  end
end
