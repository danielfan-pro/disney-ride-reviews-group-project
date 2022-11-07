class Api::V1::ReviewsController < ApiController

  def create
    ride = Ride.find(params[:ride_id])
    review = Review.new(review_params)
    review.ride = ride
    review.user = current_user
    
    if review.save
      render json: review
    else
      render json: {errors: review.errors.full_messages.to_sentence}, status: 401
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end