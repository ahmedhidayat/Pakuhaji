class DropTableFoodKid < ActiveRecord::Migration
  def change
    drop_table :food_adults
    drop_table :food_kids
  end
end
