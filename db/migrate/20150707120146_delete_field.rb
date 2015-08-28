class DeleteField < ActiveRecord::Migration
  def change
       remove_column :reservations, :id_food_kid
       remove_column :reservations, :id_food_adult
  end
end
