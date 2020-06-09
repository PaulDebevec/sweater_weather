class ArrivalForecast
  def initialize(weather, arrival_time)
    @weather = self.format_weather(weather, arrival_time)
  end

  def format_weather(weather, arrival_time)
    eta_forecast = self.find_hourly_forecast(weather, arrival_time)
    {temp: eta_forecast[:temp], description: eta_forecast[:weather][0][:description]}
  end

  def find_hourly_forecast(weather, arrival_time)
    tz_offset = weather[:timezone_offset]
    time = self.format_arrival_time(arrival_time, tz_offset)
    weather_at_eta = weather[:hourly].select do |h|
      offset_fc_time = h[:dt] + tz_offset
      difference = offset_fc_time - time
      if difference > -3600 && difference < 3600
        h
      end
    end
    weather_at_eta.first
  end

  def format_arrival_time(eta, tz_offset)
    unix_eta = self.eta_to_unix(eta)
    Time.now.to_i + unix_eta + tz_offset
  end

  def eta_to_unix(eta)
    split = eta.split(' ')
    if split.length > 2
      hr_to_sec = split[0].to_i * 3600
      min_to_sec = split[2].to_i * 60
      hr_to_sec + min_to_sec
    else
      split[0].to_i * 60
    end
  end
end
