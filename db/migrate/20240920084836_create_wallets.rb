class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 0.0
      t.string :entity_type # STI, e.g., User, Team, Stock
      t.integer :entity_id

      t.timestamps
    end

    add_index :wallets, [:entity_type, :entity_id], unique: true
  end
end