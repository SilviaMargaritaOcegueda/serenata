class Service < ApplicationRecord
  GENRES = %w[Alternative Balada Banda-sinaloense Blues Children's Classical
              Dance Electronic Hip-Hop Instrumental Jazz Latin Mariachi
              New-age Opera Parody Pop Reggae Regional Religious Rock Vocal]
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
end
