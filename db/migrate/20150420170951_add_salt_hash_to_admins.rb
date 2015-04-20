class AddSaltHashToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :password_salt, :string
    rename_column :admins, :password, :password_hash
  end
end
