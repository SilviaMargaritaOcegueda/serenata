class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.references :user
      t.references :service

      t.timestamps
    end
  end
end
