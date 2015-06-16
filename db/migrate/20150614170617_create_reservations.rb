class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :date_now
      t.datetime :date_booked
      t.integer :id_vacation_packet
      t.integer :id_game
      t.integer :people_kid
      t.integer :people_adult
      t.integer :id_food_kid
      t.integer :id_food_adult
      t.integer :id_additional_packet
      t.integer :total

      t.timestamps
    end
  end
end
