class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end
  def search
    @rides = Ride.where("name ILIKE ?", "%#{params['search_string']}%")
    binding.pry
    render json: @rides
  end
end