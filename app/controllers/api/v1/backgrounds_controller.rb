class Api::V1::BackgroundsController < ApplicationController
  def index
    background_info = UnsplashService.get_background(params['location'])
    background = Background.new(background_info)
    render json: BackgroundsSerializer.new(background)
  end
end
