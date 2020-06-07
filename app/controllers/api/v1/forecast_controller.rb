class Api::V1::ForecastController < ApplicationController
  def index
    conn_1 = Faraday.new('https://maps.googleapis.com')
    request_1 = conn_1.get("/maps/api/geocode/json?address=berthoud colorado&key=#{ENV['GEOLOC_API_KEY']}")
    json_1 = JSON.parse(request_1.body, symbolize_names: true)
    coords = json_1[:results][0][:geometry][:location]
    conn_2 = Faraday.new('https://api.openweathermap.org')
    request_2 = conn_2.get("/data/2.5/onecall?lat=#{coords[:lat]}&lon=#{coords[:lng]}&exclude=minutely&appid=#{ENV['WEATHER_API_KEY']}")
    json_2 = JSON.parse(request_2.body, symbolize_names: true)
    render json: json_2
  end
end
