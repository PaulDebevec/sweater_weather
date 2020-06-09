class OpenWeatherService
  def self.get_weather(lat, lon)
    request = conn.get('/data/2.5/onecall') do |r|
      r.params['lat'] = lat
      r.params['lon'] = lon
      r.params['exclude'] = 'minutely'
      r.params['units'] = 'imperial'
      r.params['appid'] = ENV['WEATHER_API_KEY']
    end
    JSON.parse(request.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end
end
