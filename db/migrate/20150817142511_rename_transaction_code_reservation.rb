class RenameTransactionCodeReservation < ActiveRecord::Migration
  def change
    change_column :reservations, :transaction_code, :string
  end
end
