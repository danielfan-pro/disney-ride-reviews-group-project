class Ride < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :image_url, presence: true
  validates :description, presence: true

  has_many :reviews
end