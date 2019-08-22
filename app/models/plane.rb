class Plane < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :bookings

  validates :base_price, presence: true
end
