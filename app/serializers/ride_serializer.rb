class RideSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image_url, :description

  belongs_to :user
end
