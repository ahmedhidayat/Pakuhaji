class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :content
      t.attachment :picture1
      t.attachment :picture2
      t.attachment :picture3

      t.timestamps
    end
  end
end
