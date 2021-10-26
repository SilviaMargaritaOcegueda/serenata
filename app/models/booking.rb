class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :booking_date, presence: true
end
