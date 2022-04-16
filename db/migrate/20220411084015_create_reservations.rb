class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_at
      t.date :end_at
      t.integer :number_people
      t.string :total_day
      t.integer :total_price

      t.timestamps
    end
  end
end
