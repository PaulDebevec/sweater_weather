class TravelService
  def self.get_travel_info(start, destination)
    request = conn.get('/maps/api/directions/json?') do |r|
      r.params['origin'] = start
      r.params['destination'] = destination
      r.params['units'] = 'imperial'
      r.params['key'] = ENV['GEOLOC_API_KEY']
    end
    json = JSON.parse(request.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new('https://maps.googleapis.com')
  end
end
