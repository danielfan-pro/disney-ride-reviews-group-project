class Api::V1::RidesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Ride.all
  end
  def search
    rides = Ride.where("name ILIKE ?", "%#{params['search_string']}%")
    render json: rides
  end
end