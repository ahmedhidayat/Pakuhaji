class CreateFoodKids < ActiveRecord::Migration
  def change
    create_table :food_kids do |t|
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
