class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, limit: 100
      t.string :quality, null: false
      t.decimal :price, null: false
      t.string :color, null: false
      t.string :location, null: false
      t.string :sub_category, null: false
      t.string :description

      t.timestamps
    end
  end
end