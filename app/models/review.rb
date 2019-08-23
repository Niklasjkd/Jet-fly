class Review < ApplicationRecord
  validates :content, presence: true, length: { minimum: 20 }
  belongs_to :booking
end
