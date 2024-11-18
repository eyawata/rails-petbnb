class AddPetRefToBookings < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookings, :pet, null: false, foreign_key: true
  end
end
