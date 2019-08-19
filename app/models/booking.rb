class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plane
  has_many :reviews
end
