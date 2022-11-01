class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end

end