class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
end
