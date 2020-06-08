class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: {'errors' => user.errors.full_messages.to_sentence}, status: 400
    end
  end
end
