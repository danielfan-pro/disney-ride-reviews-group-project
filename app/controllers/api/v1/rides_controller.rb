class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end

  def show
    ride = Ride.find(params[:id])
    binding.pry
    render json: ride
  end


  

end