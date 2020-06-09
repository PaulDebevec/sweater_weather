class ArrivalForecast
  def initialize(weather, arrival_time)
    @weather = self.format_weather(weather, arrival_time)
  end

def format_weather(weather, arrival_time)
  tz_offset = weather[:timezone_offset]
  time = self.format_arrival_time(arrival_time, tz_offset)
  weather_at_eta = weather[:hourly].map do |h|
    time.to_s.split('')[0..5].join('').to_i == h[:dt].to_s.split('')[0..5].join('').to_i
  end
  weather_at_eta
  require "pry"; binding.pry
end

  def format_arrival_time(eta, tz_offset)
    unix_time = self.convert_eta(eta)
    unix_now = Time.now.to_i + unix_time
    eta_in_unix = unix_now + tz_offset
    eta_in_unix
  end

  def convert_eta(eta)
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
