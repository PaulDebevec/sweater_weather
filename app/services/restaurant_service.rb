class RestaurantService
  def self.get_restaurant(search, lat, lon)
    request = conn.get('/api/v2.1/search?') do |r|
      r.params['category'] = search
      r.params['lat'] = lat
      r.params['lon'] = lon
      r.params['apikey'] = ENV['ZOMATO_API_KEY']
    end
    json = JSON.parse(request.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new('https://developers.zomato.com')
  end
end
