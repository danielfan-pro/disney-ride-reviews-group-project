class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true

  belongs_to :ride
  belongs_to :user
  
  mount_uploader :photo, ReviewPhotoUploader
end