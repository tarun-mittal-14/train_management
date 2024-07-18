class Train < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :image

  validates :name, :source, :destination, :route, :seats, presence: true
  validates :seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
