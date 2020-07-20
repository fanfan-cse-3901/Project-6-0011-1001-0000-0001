class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end
end
