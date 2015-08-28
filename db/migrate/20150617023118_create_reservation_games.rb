class CreateReservationGames < ActiveRecord::Migration
  def change
    create_table :reservation_games do |t|
    	t.integer :reservation_id
    	t.integer :game_id
      t.timestamps
    end
  end
end
