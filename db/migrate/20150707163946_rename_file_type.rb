class RenameFileType < ActiveRecord::Migration
  def change
    rename_column :foods, :type, :category
  end
end
