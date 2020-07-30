class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :item, foreign_key: true, null: false, unique: true
      t.references :user, foreign_key: true, null: false
      t.integer :rating

      t.timestamps
    end
  end
end
