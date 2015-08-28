class DeleteColumnGameIdInReservation < ActiveRecord::Migration
  def change
  	remove_column :reservations, :id_game
  end
end
