class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :train

  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
