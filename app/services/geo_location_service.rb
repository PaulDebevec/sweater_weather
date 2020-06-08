class GeoLocationService

  def self.get_coords(loc)
    request = conn.get('/maps/api/geocode/json?') do |r|
      r.params['address'] = loc
      r.params['key'] = ENV['GOOGLE_API_KEY']
    end
    json = JSON.parse(request.body, symbolize_names: true)
    json[:results][0][:geometry][:location]
  end

  private
  def self.conn
    Faraday.new('https://maps.googleapis.com')
  end
end
