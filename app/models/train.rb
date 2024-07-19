class Train < ApplicationRecord
  # attr_accessible :source, :destination
  has_many :bookings, dependent: :destroy
  has_one_attached :image

  validates  :source, :destination, :route, :seats, presence: true
  validates :name, presence: true, uniqueness: true
  validates :seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
