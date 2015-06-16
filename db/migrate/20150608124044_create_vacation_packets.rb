class CreateVacationPackets < ActiveRecord::Migration
  def change
    create_table :vacation_packets do |t|
      t.string :title
      t.string :qty_game
      t.integer :price_kid
      t.integer :price_adult

      t.timestamps
    end
  end
end
