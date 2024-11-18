class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.integer :total_price

      t.timestamps
    end
  end
end
