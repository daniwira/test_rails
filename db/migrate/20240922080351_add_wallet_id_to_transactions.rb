class AddWalletIdToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :wallet_id, :integer
    add_index :transactions, :wallet_id
  end
end
