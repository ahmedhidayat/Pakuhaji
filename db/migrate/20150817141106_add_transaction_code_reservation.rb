class AddTransactionCodeReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :transaction_code, :char
  end
end
