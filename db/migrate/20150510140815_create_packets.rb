class CreatePackets < ActiveRecord::Migration
  def change
    create_table :packets do |t|
      t.string :title
      t.text :content
      t.attachment :picture

      t.timestamps
    end
  end
end
