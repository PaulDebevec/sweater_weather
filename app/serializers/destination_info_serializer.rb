class DestinationInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :end_location, :travel_time, :forecast, :restaurant, :id
end
