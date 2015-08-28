class CreateReservationAdditionalPackets < ActiveRecord::Migration
  def change
    create_table :reservation_additional_packets do |t|
      t.integer :reservation_id
      t.integer :additional_packet

      t.timestamps
    end
  end
end
