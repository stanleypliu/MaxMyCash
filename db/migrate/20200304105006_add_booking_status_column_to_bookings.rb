class AddBookingStatusColumnToBookings < ActiveRecord::Migration[6.0]
  def change
  	add_column :bookings, :booking_status, :boolean, default: false
  end
end
