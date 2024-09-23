class RemoveEntityFromWallets < ActiveRecord::Migration[7.2]
  def change
    remove_column :wallets, :entity_type, :string
    remove_column :wallets, :entity_id, :integer
  end
end
