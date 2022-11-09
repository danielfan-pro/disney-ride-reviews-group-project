class Ride < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  has_many :reviews
  belongs_to :user
end