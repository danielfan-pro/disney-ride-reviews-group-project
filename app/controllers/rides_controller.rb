class RidesController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)

    if @ride.save
      flash[:notice] = "Ride added successfully"
      redirect_to rides_path
    else
      flash.now[:errors] = @ride.errors.full_messages.to_sentence

      render :"rides/new"
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:name, :location, :image_url, :description)
  end
end