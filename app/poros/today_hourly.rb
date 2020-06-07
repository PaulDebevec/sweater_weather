class TodayHourly
  def initialize(weather)
    @hourly_weather = format_weather(weather)
  end

  private
  def format_weather(weather)
    hourly = weather[:hourly][0..7].map do |h|
      { time: format_time(weather[:timezone_offset], h[:dt]),
        temp: h[:temp]
      }
    end
    hourly
  end

  def format_time(tz_offset, unix_time)
    offset_time = unix_time + tz_offset
    time = DateTime.strptime("#{offset_time}",'%s')
    formatted_time = time.strftime("%l:%M %p")
    formatted_time.split(' ').join(' ')
  end
end
