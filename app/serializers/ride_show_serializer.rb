class RideShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image_url, :description, :current_user

  has_many :reviews

  def reviews
    object.reviews.reverse()
  end
end