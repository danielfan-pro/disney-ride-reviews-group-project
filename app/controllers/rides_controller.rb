class RidesController < ApplicationController

  def show
    ride = Ride.find(params[:id])
    binding.pry
    
  end

end