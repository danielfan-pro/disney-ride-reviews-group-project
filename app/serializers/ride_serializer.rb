class RideSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image_url, :description
end
