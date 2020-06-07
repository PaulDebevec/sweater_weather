require 'date'

class TodayForecast
  def initialize(weather, location)
    current = weather[:current]
    @hourly_weather = TodayHourly.new(weather)

    @description = current[:weather].first[:description]
    @location = format_location(location)
    @temp_average = weather[:daily].first[:temp][:day]
    @temp_high = weather[:daily].first[:temp][:max]
    @temp_low = weather[:daily].first[:temp][:min]
    @feels_like = current[:feels_like]
    @humidity = current[:humidity]
    @visibility = meters_to_miles(current[:visibility])
    @uv_index = current[:uvi]
    @sunrise = format_time(weather[:timezone_offset], current[:sunrise])
    @sunset = format_time(weather[:timezone_offset], current[:sunset])
  end

private
  def meters_to_miles(meters)
    (meters * 0.000621371).round
  end

  def format_time(tz_offset, unix_time)
    offset_time = unix_time + tz_offset
    time = DateTime.strptime("#{offset_time}",'%s')
    time.strftime("%I:%M %p")
  end

  def format_location(location)
    city, state = location.split(',')
    if state.length == 2
      city.capitalize + ',' + state.upcase
    else
      city.capitalize + ', ' + state.capitalize
    end
  end
end
