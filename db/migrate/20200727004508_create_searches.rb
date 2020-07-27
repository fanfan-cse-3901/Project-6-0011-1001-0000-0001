class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :sub_category
      t.string :color
      t.string :quality
      t.string :price

      t.timestamps
    end
  end
end
