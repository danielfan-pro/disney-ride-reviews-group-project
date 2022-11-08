class Api::V1::UserVotesController < ApiController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    if !UserVote.where(user: current_user, review: review).take
      user_vote = UserVote.new
      user_vote.vote_value = (params[:value])
      user_vote.user = current_user
      user_vote.review = review

      review.update(score: review.score + user_vote.vote_value)
      ride = review.ride
      reviews = ride.reviews.sort_by(&:created_at).map do |review|
        ActiveModelSerializers::SerializableResource.new(review, {serializer: ReviewSerializer})
      end
      if user_vote.save
        render json: {reviews: reviews}
      else
        render json: { error: user_vote.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end