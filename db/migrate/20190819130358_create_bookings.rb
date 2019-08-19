class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.bigint :user_id
      t.bigint :kitty_id
      t.float :price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
