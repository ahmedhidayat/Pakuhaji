class CreateReservationFoods < ActiveRecord::Migration
  def change
    create_table :reservation_foods do |t|
      t.string :food_id
      t.string :reservation_id

      t.timestamps
    end
  end
end
