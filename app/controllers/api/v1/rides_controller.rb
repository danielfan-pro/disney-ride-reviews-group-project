class Api::V1::RidesController < ApiController
  before_action :authorize_admin, only: [:create]
  
  def index
    render json: Ride.all
  end

  def create
    ride = Ride.new(ride_params)
    if ride.save
      render json: ride 
    else
      render json: {errors: ride.errors.full_messages.to_sentence}, status: 401
    end
  end

  def show   
    render json: Ride.find(params[:id]), serializer: RideShowSerializer, include: ['reviews.user']
  end

  def search
    render json: Ride.where("name ILIKE ?", "%#{params['search_string']}%")
  end

  def authorized  
  end

  protected

  def authorize_admin
    if !user_signed_in? || !(current_user.role == "admin")
      render json: {error: ["Only admins have access to this feature"]}
    end
  end

  def ride_params
    params.require(:ride).permit(:name, :location, :image_url, :description)
  end
end