class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :title, :created_at

  def created_at
    object.created_at.strftime("%b %d %Y")
  end

  belongs_to :user
end
