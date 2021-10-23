class AddNumSongsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :num_songs, :integer
  end
end
