class OpenWeatherService
  def self.get_weather(lat, lon)
    params = "?lat=#{lat}&lon=#{lon}&exclude=minutely&units=imperial&appid=#{ENV['WEATHER_API_KEY']}"
    request = conn.get("/data/2.5/onecall#{params}")
    JSON.parse(request.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end
end
