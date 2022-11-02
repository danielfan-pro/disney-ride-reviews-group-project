class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :title, :created_at

  belongs_to :user
end
