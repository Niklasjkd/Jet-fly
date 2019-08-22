class Booking < ApplicationRecord
  validates :destination, presence: true
  validates :start_date, presence: true
  belongs_to :user
  belongs_to :plane
  has_many :reviews, dependent: :destroy
end
