class Plane < ApplicationRecord
  validates :location, presence: true
  validates :base_price, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :bookings
end
