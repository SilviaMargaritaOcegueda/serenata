class RemoveAmountFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :amount, :float
  end
end
