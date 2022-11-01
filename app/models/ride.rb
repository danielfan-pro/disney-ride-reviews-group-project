class Ride < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
end