class ForecastInfo
  attr_reader :today_forecast, :weekly_forecast, :id

  def initialize(weather, location)
    @id = 1
    @today_forecast = TodayForecast.new(weather, location)
    @weekly_forecast = WeeklyForecast.new(weather)
  end
end
