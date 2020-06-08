class Api::V1::FoodieController < ApplicationController
  def index
    destination_info = DestinationService.get_dest_info(params['start'], params['end'])

    restaurant_info = RestaurantService.get_restaurant(params['search'])

    require "pry"; binding.pry
  end
end
