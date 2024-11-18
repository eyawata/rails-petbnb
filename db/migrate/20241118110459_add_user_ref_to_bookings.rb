class AddUserRefToBookings < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookings, :user, null: false, foreign_key: true
  end
end
