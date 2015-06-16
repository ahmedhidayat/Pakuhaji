class CreateFoodAdults < ActiveRecord::Migration
  def change
    create_table :food_adults do |t|
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
