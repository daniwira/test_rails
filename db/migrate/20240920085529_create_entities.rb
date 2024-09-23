class CreateEntities < ActiveRecord::Migration[7.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end