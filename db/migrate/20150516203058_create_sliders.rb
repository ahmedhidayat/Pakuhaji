class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :content
      t.attachment :picture

      t.timestamps
    end
  end
end
