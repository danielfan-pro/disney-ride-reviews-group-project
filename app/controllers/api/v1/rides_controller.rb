class Api::V1::RidesController < ApplicationController
  def index
    render json: Ride.all
  end


  def show
    ride = Ride.find(params[:id])

    # content_type :json
    # json ride

    render json: ride, status: ok
  end

  

end