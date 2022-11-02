class Api::V1::RidesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Ride.all
  end

  def show   
    render json: Ride.find(params[:id]), serializer: RideShowSerializer, include: ['reviews.user']
  end

  def search
    render json: Ride.where("name ILIKE ?", "%#{params['search_string']}%")
  end
  
end