class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end

  def show
    
    render json: Ride.find(params[:id]), serializer: RideShowSerializer, include: ['reviews.user']

  end
end