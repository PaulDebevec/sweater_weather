class WeeklyForecast
  def initialize(weather)
    @daily_notes = format_days(weather[:daily][0..6])
  end

  private
  def format_days(days)
    notes_by_day = days.map do |day|
      { day: format_time(day[:dt]),
        description: day[:weather].first[:main],
        precipitation_mm: format_precipitation(day),
        temp_high: day[:temp][:max],
        temp_low: day[:temp][:min]
      }

    end
    notes_by_day
  end

  def format_time(unix_time)
    time = DateTime.strptime("#{unix_time}",'%s')
    time.strftime("%A")
  end

  def format_precipitation(weather)
    if weather[:rain]
      weather[:rain].round
    elsif weather[:snow]
      weather[:snow].round
    else
      0
    end
  end
end
