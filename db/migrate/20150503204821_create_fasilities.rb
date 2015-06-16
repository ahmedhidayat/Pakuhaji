class CreateFasilities < ActiveRecord::Migration
  def change
    create_table :fasilities do |t|
      t.string :title
      t.string :content
      t.attachment :picture1
      t.attachment :picture2
      t.attachment :picture3

      t.timestamps
    end
  end
end
