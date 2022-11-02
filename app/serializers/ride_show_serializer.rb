class RideShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image_url, :description

  has_many :reviews
end