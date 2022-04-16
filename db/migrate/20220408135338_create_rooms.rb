class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.text :room_body
      t.integer :room_price
      t.string :address
      t.string :room_image_id

      t.timestamps
    end
  end
end
