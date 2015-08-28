class UpdateReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :date_now
  end
end
