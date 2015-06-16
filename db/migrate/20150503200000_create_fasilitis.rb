class CreateFasilitis < ActiveRecord::Migration
  def change
    create_table :fasilitis do |t|
      t.string :title
      t.text :content
      t.attachment :picture1
      t.attachment :picture2
      t.attachment :picture3

      t.timestamps
    end
  end
end
