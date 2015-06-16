class CreateAdditionalPackets < ActiveRecord::Migration
  def change
    create_table :additional_packets do |t|
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
