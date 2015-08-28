class UpdateReservations2 < ActiveRecord::Migration
  def change
     add_column :reservations, :customer_id, :string
     add_column :reservations, :additional_packet_id, :string
     rename_column :reservations, :id_vacation_packet, :vacation_packet_id
     rename_column :reservations, :people_kid, :kid_count
     rename_column :reservations, :people_adult, :adult_count
  end
end
