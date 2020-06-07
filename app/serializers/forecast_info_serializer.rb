class ForecastInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :today_forecast, :weekly_forecast
end
