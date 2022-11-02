class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end

  def show
    
    ride = Ride.find(params[:id])
    reviews = ride.reviews

    render json: { ride: ride, reviews: reviews }
  end


  

end