class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :item
      t.string :email

      t.timestamps
    end
  end
end
