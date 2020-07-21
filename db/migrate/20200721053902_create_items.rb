class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :seller_id, :null => false
      t.string :title, :null => false, limit: 100
      t.string :quality, :null => false
      t.decimal :price, :null => false
      t.string :color, :null => false
      t.string :location, :null => false
      t.string :category, :null => false
      t.string :sub_category, :null => false
      t.string :description
      t.string :picture, :null => false

      t.timestamps
    end
  end
end