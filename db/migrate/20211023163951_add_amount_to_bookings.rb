class AddAmountToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :amount, :float
  end
end
