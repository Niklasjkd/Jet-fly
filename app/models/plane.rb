class Plane < ApplicationRecord
  validates :location, presence: true
  validates :base_price, presence: true, numericality: { greater_than: 0 }
  validates :price_per_min, numericality: { greater_than: 0 }
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :bookings
end
